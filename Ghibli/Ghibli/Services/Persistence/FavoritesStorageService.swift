//
//  FavoritesStorage.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/18/25.
//

/// Tiny abstraction over how favorite film IDs are persisted.
///
/// Conforming types can store data in `UserDefaults`, on disk, or in-memory mocks for testing.
protocol FavoritesStorageService {
    /// Returns the complete set of favorite film identifiers.
    func load() -> Set<String>
    /// Persists the provided IDs, overwriting any previous value.
    func save(favoriteIDs: Set<String>)
}
