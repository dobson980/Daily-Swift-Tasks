//
//  SampleDefaultsFavoritesStorageService.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/18/25.
//

import Foundation

/// Lightweight stub that returns a fixed set of favorites for SwiftUI previews.
struct SampleDefaultsFavoritesStorageService: FavoritesStorageService {
    func load() -> Set<String> {
        ["2baf70d1-42bb-4437-b551-e5fed5a87abe", "58611129-2dbc-4a81-a72f-77ddfc1b1b49"]
    }
    
    func save(favoriteIDs: Set<String>) {
        // Previews never persist changes, but we keep the method to satisfy the protocol.
    }
}
