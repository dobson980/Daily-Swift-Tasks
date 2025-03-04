//
//  ContentView.swift
//  CustomTransitions
//
//  Created by Thomas Dobson on 3/3/25.
//

import SwiftUI

// The main view that shows the "SURPRISE!" text and a button to toggle its animation.
struct ContentView: View {
    // State variable that controls whether an animation is currently running.
    @State private var isAnimating = false
    // State variable for the text’s opacity (0.0 for hidden, 1.0 for visible).
    @State private var opacity = 0.0
    // State variable for the text’s vertical position.
    @State private var pos: CGFloat = -500
    // State variable to track whether the animation should reset or play forward.
    @State private var reset = false
    
    var body: some View {
        VStack {
            Spacer() // Adds flexible space above the text.
            
            // The "SURPRISE!" text that appears and disappears with animation.
            Text("SURPRISE!")
                .font(.system(size: 55, weight: .bold, design: .default)) // Large, bold font.
                .offset(y: pos) // Adjusts the vertical position.
                .opacity(opacity) // Adjusts the opacity.
                .foregroundStyle(.indigo) // Sets the text color.
            
            Spacer() // Adds flexible space below the text.
            
            // A button that toggles between "Reset" and "What does this do?".
            Button(reset ? "Reset" : "What does this do?") {
                // Calls the function to animate the text.
                animateSurprise()
            }
            .disabled(isAnimating) // Disables the button while the animation is running.
            .buttonStyle(.borderedProminent) // Applies a prominent button style.
            .font(.largeTitle) // Sets a large font size for the button text.
        }
    }
    
    // Function to animate the "SURPRISE!" text.
    func animateSurprise() {
        if reset {
            // If reset is true, set the text’s properties to their initial state.
            self.opacity = 0.0
            self.pos = -500
            reset.toggle() // Switch reset to false.
        } else {
            // If reset is false, play the animation.
            isAnimating = true // Indicates the animation is running.
            withAnimation(.linear(duration: 3)) {
                self.opacity = 1.0 // Fade in the text.
                self.pos = 0 // Move the text to the center position.
            }
            Task {
                // Wait for the animation duration before resetting the state.
                try await Task.sleep(for: .seconds(3))
                isAnimating = false // Animation is complete.
                reset.toggle() // Switch reset to true.
            }
        }
    }
}

// Preview provider to show the ContentView in Xcode’s preview canvas.
#Preview {
    ContentView()
}
