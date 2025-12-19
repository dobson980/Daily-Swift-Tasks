//
//  SampleFilmService.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

#if DEBUG
import Foundation

/// Drop-in replacement for `GhibliApiService` used in previews and tests.
///
/// Instead of hitting the real network this service decodes a bundled JSON file,
/// which keeps SwiftUI previews deterministic and allows unit tests to run offline.
final class SampleFilmService: GhibliService {
    
    /// Loads the raw `sampleData.json` file from the app bundle.
    func fetch() async throws -> SampleData {
        guard let url = Bundle.main.url(forResource: "sampleData", withExtension: "json") else {
            throw FilmApiError.invalidUrl
        }
        
        let data = try Data(contentsOf: url)
        let sampleData = try JSONDecoder().decode(SampleData.self, from: data)
        return sampleData
        
    }

    func fetchFilms() async throws -> [Film] {
        let data = try await fetch()
        guard !data.films.isEmpty else {
            throw SampleDataError.missingFilms
        }
        return data.films
    }
    
    func searchFilm(for searchTerm: String) async throws -> [Film] {
        let allFilms = try await fetchFilms()
        return allFilms.filter { film in
            film.title.localizedStandardContains(searchTerm)
        }
    }
    
    func fetchPerson(from url: String) async throws -> Person {
        let data = try await fetch()
        guard let person = data.people.first else {
            throw SampleDataError.missingPerson
        }
        return person
    }
}
#endif
