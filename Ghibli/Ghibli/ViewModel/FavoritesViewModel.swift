//
//  Untitled.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/17/25.
//

import Foundation

/// Manages the favorites set and syncs it with persistent storage.
///
/// Because the type is `@Observable`, views like `FilmRow` and `FavoritesScreen` remain
/// in sync without having to manually publish Combine subjects or write boilerplate bindings.
@Observable
class FavoritesViewModel {
    
    /// Source of truth collection of favorite film identifiers.
    private(set) var favoriteIDs: Set<String> = []
    
    private let service: FavoritesStorageService
    
    init(service: FavoritesStorageService = DefaultsFavoritesStorageService()) {
        self.service = service
    }
    
    /// Hydrates the `favoriteIDs` set from storage—typically called during app launch.
    func load() {
        favoriteIDs = service.load()
    }
    
    /// Writes the current favorites back to storage.
    func save() {
        service.save(favoriteIDs: favoriteIDs)
    }
    
    /// Adds or removes an ID, then persists the new value.
    func toggleFavorite(filmID: String) {
        if favoriteIDs.contains(filmID) {
            favoriteIDs.remove(filmID)
        } else {
            favoriteIDs.insert(filmID)
        }
        
        save()
    }
    
    /// Convenience helper so views can read nicely (`if viewModel.isFavorite(...)`).
    func isFavorite(filmID: String) -> Bool {
        favoriteIDs.contains(filmID)
    }
}


