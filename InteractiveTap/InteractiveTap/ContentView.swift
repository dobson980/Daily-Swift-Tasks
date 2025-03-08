//
//  ContentView.swift
//  InteractiveTap
//
//  Created by Thomas Dobson on 3/8/25.
//

import SwiftUI

// The main content view displaying an interactive, animated text label.
struct ContentView: View {
    // State variable used to trigger sensory feedback.
    @State private var feedback = false
    // State variable controlling the scale (size) of the text.
    @State private var scale = 1.0

    var body: some View {
        VStack {
            // A large, bold piece of text with a gradient fill.
            Text("Hello, world!")
                .font(.system(size: 50)) // Sets the font size to 50.
                .fontWeight(.heavy) // Makes the font weight heavy (bold).
                .scaleEffect(scale) // Applies the scale transformation.
                .foregroundStyle(Gradient(colors: [.red, .blue])) // Fills the text with a red-to-blue gradient.
                .sensoryFeedback(.success, trigger: feedback) // Adds a success haptic feedback when `feedback` changes.
                .onTapGesture {
                    // Toggles the feedback state to trigger haptic feedback.
                    feedback.toggle()
                    // Smoothly scales the text up when tapped.
                    withAnimation(.easeInOut(duration: 0.2)) {
                        scale = 1.5
                    }
                    Task {
                        // Waits for 0.2 seconds before scaling back down.
                        try await Task.sleep(for: .seconds(0.2))
                        withAnimation(.easeInOut(duration: 0.2)) {
                            scale = 1.0
                        }
                    }
                }
                // Ensures the scale changes are animated using a bouncy effect.
                .animation(.bouncy, value: scale)
        }
        .padding() // Adds padding around the VStack for a cleaner layout.
    }
}

// A preview provider to display the ContentView in Xcode’s preview canvas.
#Preview {
    ContentView()
}
