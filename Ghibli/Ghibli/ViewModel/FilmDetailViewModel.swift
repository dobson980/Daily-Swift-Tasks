//
//  FilmDetailViewModel.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

import Foundation

/// Orchestrates loading of related character data for a selected film.
///
/// The implementation showcases structured concurrency: each person URL is fetched in
/// parallel via `withThrowingTaskGroup`, but the view model still updates a single
/// `LoadState` once all tasks complete or fail.
@Observable
class FilmDetailViewModel {
    
    private let service: GhibliService
    /// Tracks whether the characters are loading, ready, or failed to load.
    var state: LoadState<[Person]> = .idle
    
    init(service: GhibliService = GhibliApiService()) {
        self.service = service
    }
    
    /// Fetches the people array for the provided film only once per selection.
    func fetch(for film: Film) async {
        
        guard !state.isLoading || state.error != nil else { return }
        
        state = .loading
        
        // Some API responses include placeholder URLs such as .../people/ or .../people.
        let personURLs = film.people.filter { url in
            !(url.hasSuffix("/people") || url.hasSuffix("/people/"))
        }
        
        guard !personURLs.isEmpty else {
            state = .loaded([])
            return
        }
        
        do {
            let people = try await withThrowingTaskGroup(of: Person.self) { group in
                // Fire off one child task per person URL so network latency is overlapped.
                for url in film.people {
                    group.addTask {
                        try await self.service.fetchPerson(from: url)
                    }
                }
                
                var results: [Person] = []
                for try await person in group {
                    results.append(person)
                }
                return results
            }
            state = .loaded(people)
        } catch let error as FilmApiError {
            state = .error(error.errorDescription ?? "Unknown error")
        }catch {
            state = .error("Unknown Error")
        }
    }
    
}

import Playgrounds

#Playground {
    let vm = FilmDetailViewModel()
    
    let films = try await SampleFilmService().fetchFilms()
    
    guard let film = films.first else {
        throw SampleDataError.missingFilms
    }
    
    // Running the fetch inside the playground helps validate the task-group logic without booting the UI.
    await vm.fetch(for: film)
    
    if case .loaded(let people) = vm.state {
        _ = people
    }
    
}

