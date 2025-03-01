//
//  ContentView.swift
//  InteractiveButton
//
//  Created by Thomas Dobson on 3/1/25.
//

import SwiftUI

// The main view of the application that displays a button with scaling animation.
struct ContentView: View {
    // State variable to control the button’s scale.
    @State private var buttonScale: CGFloat = 1.0
    // State variable to indicate whether the animation is currently running.
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Spacer() // Adds flexible space at the top.
            
            // A button that triggers the scaling animation when pressed.
            Button {
                // Start the asynchronous scaling animation when the button is tapped.
                Task {
                    await scaleButton()
                }
            } label: {
                // The button’s label is simple text.
                Text("Press Me")
                    .font(.system(size: 35))
            }
            .buttonStyle(.borderedProminent) // Uses a prominent bordered button style.
            .disabled(isAnimating) // Disables the button while the animation is running.
            .scaleEffect(buttonScale) // Applies the scale effect to the button.
            
            Spacer() // Adds flexible space below the button.
        }
        .padding() // Adds padding around the entire VStack.
    }
    
    // An asynchronous function that scales the button up, then down, with a delay in between.
    func scaleButton() async {
        isAnimating = true // Prevent additional presses while the animation runs.
        withAnimation(.easeIn) {
            buttonScale = 1.5 // Increase the scale of the button.
        }
        try? await Task.sleep(nanoseconds: 500_000_000) // Wait for 0.5 seconds.
        withAnimation(.easeOut) {
            buttonScale = 1.0 // Return the button to its original scale.
        }
        try? await Task.sleep(nanoseconds: 500_000_000) // Wait for 0.5 seconds.
        isAnimating = false // Allow the button to be pressed again.
    }
}

// Xcode preview for ContentView.
#Preview {
    ContentView()
}
