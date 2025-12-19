//
//  Person.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import Foundation

/// Character metadata fetched from the people endpoint for the selected film.
///
/// Only a subset of the fields is displayed in the UI today, but we keep the rest so
/// future experiments (for example, filtering by species) do not require touching the decoder.
struct Person: Identifiable, Decodable, Equatable {
    /// Stable identifier used by `ForEach` and local caching.
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    /// Array of film URLs this character appears in (useful for cross references later).
    let films: [String]
    let species: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
}

import Playgrounds

#Playground {
    /// Lightweight harness to quickly ensure the `/people/{id}` endpoint still
    /// deserializes into the `Person` type – extremely handy when the API contract changes.
    let url = URL(string: "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9")!
    
    do {
        let (data, _) =  try await URLSession.shared.data(from: url)
        
        // A thrown error here signals the schema drifted from what the main app expects.
        _ = try JSONDecoder().decode(Person.self, from: data)
    } catch {
        print(error)
    }

}
