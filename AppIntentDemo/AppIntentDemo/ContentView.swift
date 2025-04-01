//
//  ContentView.swift
//  AppIntentDemo
//
//  Created by Thomas Dobson on 4/1/25.
//
//  This file represents the main view of the application. It displays
//  input fields for entering an email and a password. The focus state for
//  these fields is managed via the FocusedField enum and SwiftUI's focus
//  system. The view updates its focus state automatically based on changes
//  from a shared AppIntentsController instance.

import SwiftUI

/// The main content view of the application.
///
/// This view presents text fields for user credentials and manages their
/// focus state. The focus is controlled by an instance of `FocusedField`
/// and synchronized with a shared controller.
struct ContentView: View {
    
    /// The email address entered by the user.
    @State private var email: String = ""
    
    /// The password entered by the user.
    @State private var password: String = ""
    
    /// The focus state for the text fields, bound to a `FocusedField` enum value.
    @FocusState private var focusedField: FocusedField?
    
    /// The body property containing the view's layout and behavior.
    var body: some View {
        VStack {
            Spacer() // Pushes the input fields toward the bottom of the view.
            
            // Email text field with focus bound to the '.email' case.
            TextField("Email", text: $email)
                .focused($focusedField, equals: .email)
            
            // Secure text field with focus bound to the '.password' case.
            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
        }
        .textFieldStyle(.roundedBorder) // Applies a rounded border style to text fields.
        .onChange(of: AppIntentsController.shared.focusedField) { _, newValue in
            // Updates the local focus state when the shared controller's focusedField changes.
            focusedField = newValue
        }
        .padding() // Adds padding around the content.
    }
}

/// An enum representing the focusable text fields in the view.
///
/// This enum is used to specify which text field should be focused.
/// It supports three states: no field, the email field, and the password field.
enum FocusedField: String {
    case none, email, password
}

#Preview {
    ContentView()
}
