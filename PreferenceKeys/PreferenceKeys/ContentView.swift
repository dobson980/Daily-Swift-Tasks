//
//  ContentView.swift
//  PreferenceKeys
//
//  Created by Thomas Dobson on 2/24/25.
//

import SwiftUI

// This is the main content view of the app.
struct ContentView: View {
    // This state variable holds the value coming from child views.
    // It will update whenever the child sets a new preference value.
    @State private var childAppValue: String = "Initial Value"
    
    var body: some View {
        VStack {
            // A vertical stack to display app-related information.
            VStack {
                // Title for the app.
                Text("Dads App")
                // Displays the current value coming from the child view.
                Text("Child View: \(childAppValue)")
            }
            // Adds some space below the text before the next section.
            .padding(.bottom, 10)
            
            // A horizontal stack that includes the child view.
            // The child view will provide a preference value that this parent listens to.
            HStack {
                ChildView()
            }
        }
        // Adds padding around the entire VStack for a cleaner layout.
        .padding(20)
        // Listens for changes to the DadsPreferenceKey.
        // When the child view updates the preference value, this closure gets triggered,
        // and `childAppValue` is updated with the new value.
        .onPreferenceChange(DadsPreferenceKey.self) { newValue in
            childAppValue = newValue
        }
    }
}

#Preview {
    // Provides a preview of ContentView in Xcode.
    ContentView()
}
