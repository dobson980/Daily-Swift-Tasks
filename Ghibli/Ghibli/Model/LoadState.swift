//
//  LoadState.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

/// Simple dependency-free state machine shared by all view models.
///
/// Wrapping the async loading lifecycle inside a generic enum keeps the UI declarative:
/// SwiftUI `switch` statements can decide what to show based on these cases without
/// needing multiple Boolean flags floating around.
enum LoadState<Value>: Equatable where Value: Equatable {
    /// No work has been triggered yet (fresh launch or search cleared).
    case idle
    /// A task is currently running – used to drive `ProgressView` spinners.
    case loading
    /// Completed successfully with concrete data to render.
    case loaded(Value)
    /// Completed with a user-readable error message.
    case error(String)
    
    /// Convenience accessor so view models can gate duplicate network calls.
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
    
    /// Extracts the associated value in a type-safe way when the state equals `.loaded`.
    var data: Value? {
        if case .loaded(let value) = self { return value }
        return nil
    }
    
    /// Extracts the associated error message, keeping UI code super concise.
    var error: String? {
        if case .error(let message) = self { return message }
        return nil
    }
}
