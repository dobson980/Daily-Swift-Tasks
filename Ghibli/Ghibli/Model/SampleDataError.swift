//
//  SampleDataError.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import Foundation

/// Errors related to the local sample JSON loader used in previews and tests.
///
/// Keeping these separate from `FilmApiError` helps you immediately understand
/// whether a failure came from disk (sample bundle) or the live API.
enum SampleDataError: LocalizedError {
    /// Could not locate the bundled JSON file. Most likely a build phase issue.
    case invalidURL
    /// Requested a person from the sample data but none were provided.
    case missingPerson
    /// Sample data did not include any films, so the UI would have nothing to render.
    case missingFilms
}
