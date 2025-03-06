//
//  ContentView.swift
//  BindableComponent
//
//  Created by Thomas Dobson on 3/5/25.
//

import SwiftUI

// This is the main content view of the application.
struct ContentView: View {
    // State variable that tracks whether it’s raining.
    // This is bound to the CustomToggle and updates the image accordingly.
    @State private var raining = false

    var body: some View {
        // A vertical stack that arranges the image and the toggle component.
        VStack(spacing: 40) {
            // The image changes based on the value of the `raining` state variable.
            Image(systemName: raining ? "cloud.rain" : "sun.max")
                .font(.system(size: 100)) // Sets the image size.
                .frame(width: 100, height: 100) // Defines a fixed frame for consistency.
                .symbolRenderingMode(.palette) // Allows multiple color layers.
                .foregroundStyle(
                    raining ? .gray : .yellow, // Outer color
                    raining ? .blue : .yellow  // Inner color
                )
                .animation(.easeInOut, value: raining) // Smoothly animates the change.

            // CustomToggle is a reusable component that controls the `raining` state.
            CustomToggle(toggleState: $raining)
        }
        .padding() // Adds padding around the entire stack.
    }
}

// A preview provider that shows how ContentView looks in Xcode’s canvas.
#Preview {
    ContentView()
}
