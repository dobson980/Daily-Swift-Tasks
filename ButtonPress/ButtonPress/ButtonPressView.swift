//
//  ContentView.swift
//  ButtonPress
//
//  Created by Thomas Dobson on 3/21/25.
//

import SwiftUI

/// A view that displays an animated circular button.
/// The button features an angular gradient fill, a white stroke overlay
/// with a shadow, and an outer shadow for depth. Tapping the button triggers
/// an animation that scales the button down briefly before returning it to
/// its original size.
struct ButtonPressView: View {
    /// The current scale value of the button.
    /// This state variable allows the view to animate the scaling effect
    /// when the button is tapped.
    @State private var scale = 1.0
    
    /// The body property that defines the view hierarchy.
    /// It contains a circular button that reacts to tap gestures.
    var body: some View {
        VStack {
            // A circular button with customized appearance.
            Circle()
                // Apply an angular gradient fill for a dynamic color transition.
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [.blue, .purple, .pink, .blue]),
                        center: .center
                    )
                )
                // Define the fixed size of the circle.
                .frame(width: 150, height: 150)
                // Overlay the circle with a white stroke and a subtle shadow for a raised effect.
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                )
                // Apply an outer shadow to enhance depth perception.
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                // Scale the circle based on the current state value.
                .scaleEffect(scale)
                // Animate scale changes with an easeInOut timing.
                .animation(.easeInOut(duration: 0.05), value: scale)
                // Add a tap gesture recognizer to the circle.
                .onTapGesture {
                    // Execute the tap animation asynchronously.
                    Task {
                        // Animate the scaling down effect.
                        withAnimation {
                            scale = 0.9
                        }
                        
                        // Pause briefly (50 milliseconds) to enhance the effect.
                        try await Task.sleep(nanoseconds: 50_000_000)
                        
                        // Animate the scaling back to the original size.
                        withAnimation {
                            scale = 1.0
                        }
                    }
                }
        }
        // Add padding around the button container.
        .padding()
    }
}

/// Preview provider for the ButtonPressView.
/// This enables live previews in Xcode's canvas.
#Preview {
    ButtonPressView()
}
