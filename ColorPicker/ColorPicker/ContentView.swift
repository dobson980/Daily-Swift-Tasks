//
//  ContentView.swift
//  ColorPicker
//
//  Created by Thomas Dobson on 3/6/25.
//

import SwiftUI

// This view demonstrates using a ColorPicker to dynamically change the text color.
struct ContentView: View {
    // A @State variable to store the currently selected color.
    // The text’s foreground color will be updated whenever this value changes.
    @State private var pickedColor: Color = .black
    
    var body: some View {
        VStack(spacing: 30) {
            // A text label that displays "Change my color."
            // Its color is directly tied to the pickedColor state.
            Text("Change my color")
                .font(.system(size: 40))  // Sets a large font size.
                .font(.largeTitle)        // Also sets the font style as a large title.
                .foregroundStyle(pickedColor) // Changes the text color based on pickedColor.
            
            // A ColorPicker control for selecting a color.
            // The empty label ("") hides the default label since the text above
            // provides context. Its value is bound to the pickedColor state.
            ColorPicker("", selection: $pickedColor)
                .labelsHidden() // Hides the default "Color" label.
        }
        .padding() // Adds padding around the VStack for a cleaner layout.
    }
}

// A preview provider that displays the ContentView in Xcode’s preview canvas.
// This allows you to see the ColorPicker in action while editing.
#Preview {
    ContentView()
}
