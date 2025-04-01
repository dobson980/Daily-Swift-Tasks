//
//  AppIntentsController.swift
//  AppIntentDemo
//
//  Created by Thomas Dobson on 4/1/25.
//
//  This file defines the AppIntentsController class, which is responsible
//  for managing the shared state of the application’s intents. It contains
//  a property that tracks which text field is currently focused.
//  The class is implemented as a singleton to provide a global point of access.

import Foundation
import SwiftUI

/// The AppIntentsController class manages the shared state for AppIntents,
/// particularly the focus of text fields in the UI.
///
/// The class employs the singleton pattern via the static `shared` property.
/// Marked with `@Observable`, it allows SwiftUI views to react to changes
/// when the focused field is updated.
@Observable
class AppIntentsController {
    
    /// A shared singleton instance to provide global access.
    static let shared = AppIntentsController()
    
    /// Tracks the currently focused text field.
    ///
    /// The value is of type `FocusedField`. It defaults to `.none`,
    /// indicating that no text field is currently focused.
    var focusedField: FocusedField = .none
    
}
