//
//  Film.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import Foundation

/// Immutable model that mirrors the fields returned by the Studio Ghibli REST API.
///
/// It is shared across networking, view models, and SwiftUI views so every layer
/// talks the same language.  The struct conforms to `Identifiable` and `Hashable`
/// to make it easy to drive `List`/`NavigationStack`, and `Codable` so the exact
/// JSON payload can be decoded without manual mapping code.
struct Film: Codable, Identifiable, Equatable, Hashable {
    /// Primary identifier from the API. Stored as a `String` because the backend uses UUIDs.
    let id: String
    /// Display name shown through the list, detail screen, and favorites UI.
    let title: String
    /// Long form synopsis, surfaced on the detail screen.
    let description: String
    /// Name of the film's director, highlighted underneath the poster artwork.
    let director: String
    /// Producer credit. Useful for filtering or metadata displays.
    let producer: String
    
    /// Calendar year string returned by the API (for example, "1986").
    let releaseYear: String
    /// Rotten Tomatoes score provided in the payload as a string percentage.
    let score: String
    /// Running time in minutes. Stored as a textual value because the API uses strings.
    let duration: String
    /// Poster-sized image URL used in `FilmRow` and the search results grid.
    let image: String
    /// Landscape banner URL that makes the hero section in the detail screen.
    let bannerImage: String
    
    /// Collection of person endpoints the app can follow to lazily fetch character data.
    let people: [String]
        
    /// Maps snake_case JSON keys into the camelCase Swift properties without writing custom decoding logic.
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer, people
        case bannerImage = "movie_banner"
        case releaseYear = "release_date"
        case duration = "running_time"
        case score = "rt_score"
    }
}

#if DEBUG
extension Film {
    /// Convenience data used in previews, tests, and offline prototyping.
    ///
    /// Having a single authoritative `preview` constant avoids sprinkling fake
    /// dictionaries throughout the UI code and keeps the views deterministic.
    static let preview = Film(
        id: "preview",
        title: "Castle in the Sky",
        description: "A young girl and boy search for a legendary floating castle.",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        releaseYear: "1986",
        score: "95",
        duration: "124",
        image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
        bannerImage: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
        people: [
            "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9",
            "https://ghibliapi.vercel.app/people/fe93adf2-2f3a-4ec4-9f68-5422f1b87c01",
            "https://ghibliapi.vercel.app/people/3bc0b41e-3569-4d20-ae73-2da329bf0786",
            "https://ghibliapi.vercel.app/people/40c005ce-3725-4f15-8409-3e1b1b14b583",
            "https://ghibliapi.vercel.app/people/5c83c12a-62d5-4e92-8672-33ac76ae1fa0",
            "https://ghibliapi.vercel.app/people/e08880d0-6938-44f3-b179-81947e7873fc",
            "https://ghibliapi.vercel.app/people/2a1dad70-802a-459d-8cc2-4ebd8821248b"
        ]
    )
}
#endif

import Playgrounds

#Playground {
    /// Quick smoke test that the deployed endpoint still returns data that matches
    /// the `Film` structure. Running this in the Swift Playgrounds canvas is much
    /// faster than booting the app when you just want to verify decoding logic.
    let url = URL(string: "https://ghibliapi.vercel.app/films")!
    
    do {
        let (data, _) =  try await URLSession.shared.data(from: url)
        
        // Decoding will throw if the schema changed, which alerts you before running full UI tests.
        _ = try JSONDecoder().decode([Film].self, from: data)
    } catch {
        print(error)
    }

}

