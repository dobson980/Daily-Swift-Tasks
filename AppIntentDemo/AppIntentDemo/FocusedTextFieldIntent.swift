//
//  FocusedTextFieldIntent.swift
//  AppIntentDemo
//
//  Created by Thomas Dobson on 4/1/25.
//
//  This file defines an AppIntent that allows the app to focus a specific text field
//  based on a given parameter. The intent updates a shared controller's state which
//  in turn triggers the UI focus change in the ContentView.
//

import Foundation
import AppIntents

/// An AppIntent that focuses a specific text field in the application.
///
/// The intent accepts a string parameter representing the field to be focused (e.g., "email" or "password").
/// It updates the AppIntentsController's shared instance with the corresponding `FocusedField` value.
struct FocusedTextFieldIntent: AppIntent {
    
    /// The user-visible title of the intent.
    static var title = LocalizedStringResource("Focus Text Field")
    
    /// A brief description of what the intent does.
    static var description = IntentDescription("Enter your credentials")
    
    /// Indicates whether the app should open when this intent is run.
    static var openAppWhenRun: Bool = true
    
    /// The parameter representing the text field to focus.
    ///
    /// The parameter expects a string value. It is converted to lowercase and then used
    /// to create a `FocusedField` enum value by matching it to its raw value.
    @Parameter(title: "Focused Field") var focusedField: String
    
    /// Performs the intent.
    ///
    /// This method converts the provided `focusedField` string into a corresponding `FocusedField` enum value.
    /// The resulting value is then assigned to the shared `AppIntentsController`'s `focusedField` property,
    /// which triggers the appropriate UI change.
    ///
    /// - Returns: An `.result()` indicating the operation was successful.
    func perform() async throws -> some IntentResult {
        // Convert the input string to lowercase and initialize the FocusedField enum.
        AppIntentsController.shared.focusedField = FocusedField(rawValue: focusedField.lowercased())!
        return .result()
    }
}
