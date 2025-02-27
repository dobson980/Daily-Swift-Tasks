//
//  DragableBox.swift
//  GestureBox
//
//  Created by Thomas Dobson on 2/25/25.
//

import SwiftUI

// This SwiftUI view defines a draggable, tappable box with a dynamic color.
struct DragableBox: View {
    // Gesture state that holds the current drag offset while the user is dragging.
    @GestureState private var offset: CGSize = .zero
    // State variable that holds the final position of the box after dragging ends.
    @State private var currentOffset: CGSize = .zero
    // State variable that stores the current color of the box.
    @State private var boxColor: Color = .red
    
    var body: some View {
        // A rectangle that the user can drag and tap.
        Rectangle()
            .frame(width: 75, height: 75) // Sets the dimensions of the box.
            .foregroundColor(boxColor) // Sets the box’s color based on the current state.
            // Adjusts the position of the box based on the drag offset and the saved offset.
            .offset(x: currentOffset.width + offset.width, y: currentOffset.height + offset.height)
            // Adds a tap gesture to change the box color.
            .onTapGesture {
                pickColor(currentColor: boxColor)
            }
            // Adds a drag gesture to move the box around the screen.
            .gesture(
                DragGesture()
                    .updating($offset) { current, state, _ in
                        // Updates the offset while dragging.
                        state = current.translation
                    }
                    .onEnded { final in
                        // Saves the final drag position to `currentOffset` after the drag ends.
                        currentOffset.width += final.translation.width
                        currentOffset.height += final.translation.height
                    }
            )
    }
    
    // Function to pick a new random color that’s different from the current one.
    func pickColor(currentColor: Color) {
        // Prints a message each time the function is called.
        print("pickColor called")
        
        // An array of possible colors to choose from.
        let colors: [Color] = [.red, .green, .blue, .yellow, .brown, .orange, .pink, .purple]
        
        // Choose a random new color.
        var newColor = colors.randomElement()
        
        // Ensure the new color is different from the current color.
        while newColor == currentColor {
            newColor = colors.randomElement()
        }
        
        // Set the box color to the new color or default to black if something goes wrong.
        boxColor = newColor ?? .black
    }
}

// A preview provider that allows you to see the DragableBox in Xcode’s preview canvas.
#Preview {
    DragableBox()
}
