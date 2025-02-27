//
//  ChildView.swift
//  PreferenceKeys
//
//  Created by Thomas Dobson on 2/24/25.
//

import SwiftUI

// The ChildView struct defines a simple view that takes user input.
struct ChildView: View {
    // A private state variable to hold the text input from the TextField.
    // SwiftUI automatically updates this variable as the user types.
    @State private var childText: String = ""
    
    var body: some View {
        // A text field where the user can enter some text.
        TextField("Enter Some Text", text: $childText)
            // The `updateDadsPreferenceKey(with:)` method is a custom view modifier
            // defined earlier. It takes the value of `childText` and sets it as a preference.
            .updateDadsPreferenceKey(with: childText)
            // This gives the text field a rounded border style for a nicer appearance.
            .textFieldStyle(.roundedBorder)
    }
}

// The #Preview attribute allows you to see a live preview of ChildView in Xcode.
// This is helpful for quickly iterating on the design and functionality.
#Preview {
    ChildView()
}
