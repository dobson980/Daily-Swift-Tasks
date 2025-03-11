//
//  ContentView.swift
//  CustomToggle
//
//  Created by Thomas Dobson on 3/10/25.
//

import SwiftUI

struct ContentView: View {
    // State variable for controlling whether the light is on.
    // This state is passed to both the lightbulb image and CustomToggle.
    @State private var lightIsOn: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            // The lightbulb image changes based on the lightIsOn state.
            // It uses a symbol with a palette rendering mode and animates changes smoothly.
            Image(systemName: lightIsOn ? "lightbulb.led.fill" : "lightbulb.led")
                .font(.system(size: 120))
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    lightIsOn ? .yellow : .gray, // Primary color depends on the state.
                    .gray // Secondary color remains gray.
                )
                // Animate any change in the lightIsOn value using easeInOut.
                .animation(.easeInOut(duration: 0.3), value: lightIsOn)
            Spacer()
            // Instructional text prompting the user.
            Text("Turn on the light")
            // The custom toggle is integrated below the image.
            // It is bound to the lightIsOn state, so tapping the toggle will update the lightbulb.
            CustomToggle(isToggled: $lightIsOn)
        }
        .padding() // Padding around the VStack for a better layout.
    }
}

#Preview {
    ContentView()
}
