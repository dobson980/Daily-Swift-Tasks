//
//  ContentView.swift
//  ButtonAnimations
//
//  Created by Thomas Dobson on 2/28/25.
//

import SwiftUI

// The main view of the application that displays a button with a dynamically changing ring color.
struct ContentView: View {
    // State variable that tracks the current color of the button’s ring.
    @State private var buttonRingColor: Color = .orange
    
    var body: some View {
        VStack {
            // The button that changes the ring color when pressed.
            Button {
                // On button tap, change the ring color to a new random color.
                buttonRingColor = changeColor(currentColor: buttonRingColor)
            } label: {
                // The button’s label is an SF Symbol with a palette rendering mode.
                Image(systemName: "button.programmable")
                    .font(.system(size: 156)) // Sets the symbol size.
                    .symbolRenderingMode(.palette) // Allows using multiple colors.
                    .foregroundStyle(.black, buttonRingColor) // Applies black and the current ring color.
            }
            // Adds a subtle breathe effect to the symbol, keyed on the ring color.
            .symbolEffect(.breathe, value: buttonRingColor)
        }
    }
    
    // A function that changes the color to a new random value.
    func changeColor(currentColor: Color) -> Color {
        // A list of available colors to choose from.
        let availableColors: [Color] = [.blue, .green, .yellow, .red, .orange, .purple, .brown, .indigo, .mint]
        var newColor: Color
        
        // Generate a new color until it’s different from the current one.
        repeat {
            newColor = availableColors.randomElement() ?? .red
        } while newColor == currentColor
        
        // Return the new color.
        return newColor
    }
}

// A preview provider for Xcode’s canvas to see ContentView in action.
#Preview {
    ContentView()
}
