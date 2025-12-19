//
//  GhibliApiService.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import Foundation

/// Async interface that abstracts where film data comes from (live network vs. local bundle).
///
/// Declaring the protocol as `Sendable` lets us safely pass conforming instances across
/// concurrency domains (for example, into `Task` groups) without tripping Swift's data-race checks.
protocol GhibliService: Sendable {
    /// Fetches the entire film catalog.
    func fetchFilms() async throws -> [Film]
    /// Fetches character metadata given the canonical URL provided by the API.
    func fetchPerson(from url: String) async throws -> Person
    
    /// Performs a client-side search by filtering the cached film list.
    func searchFilm(for searchTerm: String) async throws -> [Film]
}

