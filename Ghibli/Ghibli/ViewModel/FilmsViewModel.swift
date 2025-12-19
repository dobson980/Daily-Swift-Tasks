//
//  FilmsViewModel.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import Foundation

/// Loads the full catalog of Studio Ghibli films and exposes them to the SwiftUI hierarchy.
///
/// Annotated with `@Observable` so tabs, favorites, and search screens can subscribe to
/// the same instance and automatically react when the async fetch completes.
@Observable
class FilmsViewModel {
    
    private let service: GhibliService
    /// Memory cache of the fetched films, reused by favorites and search to avoid duplicate downloads.
    var films: [Film] = []
    /// Tracks the async lifecycle so the UI can render loading, success, or error states declaratively.
    var state: LoadState<[Film]> = .idle
    
    init(service: GhibliService = GhibliApiService()) {
        self.service = service
    }
    
    /// Fetches the catalog once and guards against overlapping requests.
    ///
    /// The guard allows retries when the last attempt failed (state contains an error),
    /// but prevents wasting bandwidth if the data is already loading or loaded.
    func fetch() async {
        
    // Prevent overlapping fetches unless we're retrying after an error.
    guard !state.isLoading || state.error != nil else { return }
        
        state = .loading
        
        do {
            films = try await service.fetchFilms()
            state = .loaded(films)
        } catch let error as FilmApiError {
            state = .error(error.localizedDescription)
        } catch {
            state = .error("An unexpected error occurred: \(error)")
        }
    }
}
