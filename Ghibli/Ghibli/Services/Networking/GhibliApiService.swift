//
//  Film.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import Foundation



/// Production implementation that talks to https://ghibliapi.vercel.app via `URLSession`.
///
/// The helper `fetch(_:type:)` centralizes the boilerplate for building requests,
/// validating responses, and decoding JSON.  View models only ever see strongly typed
/// `Film` or `Person` arrays, which keeps async workflows easy to reason about.
final class GhibliApiService: GhibliService {
    
    /// Generic pipeline for any GET endpoint the demo needs.
    /// - Parameters:
    ///   - URLString: Raw endpoint string, typically provided by the API itself.
    ///   - type: Result model to decode into.
    /// - Returns: A decoded model `T` or throws a `FilmApiError` describing what went wrong.
    func fetch<T: Decodable>(from URLString: String, type: T.Type) async throws -> T {
        guard let url = URL(string: URLString) else {
            throw FilmApiError.invalidUrl
        }
        
        let data: Data
        let response: URLResponse
        
        do {
            // Async/await keeps the API surface clean while still performing the network call on a background thread.
            (data, response) = try await URLSession.shared.data(from: url)
        } catch let error as URLError {
            throw FilmApiError.networkError(error)
        } catch {
            throw FilmApiError.unknownError(error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw FilmApiError.invalidResponse(statusCode: -1)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw FilmApiError.invalidResponse(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw FilmApiError.decodingError(error)
        } catch {
            throw FilmApiError.unknownError(error)
        }
    }
    
    /// Loads the canonical list of Studio Ghibli films.
    func fetchFilms() async throws -> [Film] {
        let url = "https://ghibliapi.vercel.app/films"
        return try await fetch(from: url, type: [Film].self)
    }
    
    /// Filters the fetched film list using `localizedStandardContains` for a friendlier search experience.
    func searchFilm(for searchTerm: String) async throws -> [Film] {
        let allFilms = try await fetchFilms()
        return allFilms.filter { film in
            film.title.localizedStandardContains(searchTerm)
        }
    }
    
    /// Fetches a single `Person` by following the absolute URL embedded in the film payload.
    func fetchPerson(from url: String) async throws -> Person {
        return try await fetch(from: url, type: Person.self)
    }
    
    
}
