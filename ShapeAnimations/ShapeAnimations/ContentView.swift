//
//  ContentView.swift
//  ShapeAnimations
//
//  Created by Thomas Dobson on 2/27/25.
//

import SwiftUI

// The main ContentView struct that rotates a rectangle on button press.
struct ContentView: View {
    // State variable to track the rotation angle of the rectangle.
    @State private var rotation: Angle = .zero
    
    var body: some View {
        VStack {
            Spacer() // Adds flexible spacing at the top.
            
            // Horizontal stack containing the rotating rectangle.
            HStack {
                Rectangle()
                    .frame(width: 150, height: 150) // Sets the rectangle’s size.
                    .rotationEffect(rotation) // Applies the rotation based on the `rotation` state.
                    .animation(.easeInOut(duration: 1), value: rotation) // Smoothly animates the rotation changes.
            }
            
            Spacer() // Adds flexible spacing before the button.
            
            // Button that increments the rotation angle when pressed.
            Button {
                rotation += Angle(degrees: 90) // Rotates the rectangle 90 degrees on each press.
            } label: {
                Text("Animate Me") // The text displayed on the button.
            }
            .buttonStyle(.borderedProminent) // Applies a prominent button style.
        }
    }
}

// Xcode preview for seeing ContentView in the canvas.
#Preview {
    ContentView()
}
