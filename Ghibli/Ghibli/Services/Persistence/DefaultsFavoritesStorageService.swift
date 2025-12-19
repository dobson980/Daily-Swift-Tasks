//
//  DefaultsFavoritesStorageService.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/18/25.
//

import Foundation

/// Persists favorites inside `UserDefaults` so they survive app relaunches.
struct DefaultsFavoritesStorageService: FavoritesStorageService {
    
    /// Dedicated key namespaced to avoid collisions with other sample apps.
    private let favoritesKey = "GhibliExplorer.FavoriteFilms"
    
    func load() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: favoritesKey)
        return Set(array ?? [])
    }
    
    func save(favoriteIDs: Set<String>) {
        UserDefaults.standard.set(Array(favoriteIDs), forKey: favoritesKey)
    }
    
    
}
