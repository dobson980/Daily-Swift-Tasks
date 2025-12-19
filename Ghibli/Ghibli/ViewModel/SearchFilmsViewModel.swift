//
//  File.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/18/25.
//

import Foundation

/// Handles the debounced text search experience on the Search tab.
///
/// The view model keeps track of the latest query so it can ignore stale async responses—a
/// common concurrency pitfall when users type quickly and tasks finish out of order.
@Observable
class SearchFilmsViewModel {
    /// Mirrored by the view to render loading indicators, results, or errors.
    var state: LoadState<[Film]> = .idle
    /// Stores the newest user query so background tasks can decide if their response is still relevant.
    private var currentSearchTerm: String = ""
    private let service: GhibliService
    
    init(service: GhibliService = GhibliApiService()) {
        self.service = service
    }
    
    /// Launches a debounced asynchronous search request for the provided term.
    func fetch(for searchTerm: String) async {
        self.currentSearchTerm = searchTerm
        
        guard !searchTerm.isEmpty else {
            state = .idle
            return
        }
        
        state = .loading
        
        // 500ms debounce prevents hammering the API while the user is still typing.
        try? await Task.sleep(for: .milliseconds(500))
        // If the user typed something new, the surrounding Task will be cancelled and we bail out early.
        guard !Task.isCancelled else {
            // Reset to idle so the UI clears any stale spinner when the work is cancelled mid-flight.
            state = .idle
            return
        }
        
        do {
            let films = try await service.searchFilm(for: searchTerm)
            self.state = .loaded(films)
        } catch {
            setError(error, for: searchTerm)
        }
    }
    
    /// Converts any thrown error into a user friendly `LoadState` **only** if it matches the most recent query.
    func setError(_ error: Error, for searchTerm: String) {
        
        guard currentSearchTerm == searchTerm else { return }
        
        if let error = error as? FilmApiError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } else {
            self.state = .error("unknown error")
        }
        
    }
}
