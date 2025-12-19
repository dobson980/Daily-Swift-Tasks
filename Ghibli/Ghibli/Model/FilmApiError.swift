//
//  FilmApiError.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import Foundation

/// Centralized list of recoverable errors that can bubble up from the networking layer.
///
/// Propagating strongly typed errors through the async/await call stack makes it easier
/// for view models to display a user friendly message and for unit tests to assert
/// specific failure modes (for example, distinguishing connectivity issues from decoding bugs).
enum FilmApiError: LocalizedError {
    /// Could not build a valid `URL` from the provided string (usually a developer misconfiguration).
    case invalidUrl
    /// The server responded but with a non-2xx status code.
    case invalidResponse(statusCode: Int)
    /// Bubbles up the underlying `URLError` so callers can inspect the exact network failure.
    case networkError(URLError)
    /// JSON decoding failed because the schema changed or the payload is malformed.
    case decodingError(DecodingError)
    /// Catch-all for unexpected errors so we still surface *something* informative to the UI.
    case unknownError(Error)
    
    /// Human readable description surfaced inside snack bars, alerts, or the list placeholder.
    var errorDescription: String? {
        switch self {
            case .invalidUrl: return "Invalid URL"
            case .invalidResponse(statusCode: let code): return "Invalid response with status code: \(code)"
            case .networkError(let error): return "Network error: \(error)"
            case .decodingError(let error): return "Decoding error: \(error)"
            case .unknownError(let error): return "Unknown error: \(error)"
        }
    }
}
