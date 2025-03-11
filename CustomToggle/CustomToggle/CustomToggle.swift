//
//  CustomToggle.swift
//  CustomToggle
//
//  Created by Thomas Dobson on 3/10/25.
//

import SwiftUI

// CustomToggle is a reusable view representing a toggle switch.
// It uses a binding to a Boolean value (isToggled) so that its on/off state can be managed by a parent view.
struct CustomToggle: View {
    // Binding property: allows two-way data flow between this view and its parent.
    // Changing isToggled here updates the parent's state and vice versa.
    @Binding var isToggled: Bool
    
    var body: some View {
        // ZStack is used to layer the toggle components on top of each other.
        ZStack {
            // The track of the toggle: a rounded rectangle that changes color based on the toggle state.
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 50, height: 30)  // Fixed dimensions for consistency.
                // Uses a blue color when the toggle is on, gray when off.
                .foregroundStyle(isToggled ? Color.blue : Color.gray)
            
            // The thumb of the toggle: a circle that moves horizontally depending on isToggled.
            Circle()
                .frame(width: 25, height: 25)  // Slightly smaller than the track for visual balance.
                .foregroundStyle(.white)       // White color to stand out against the track.
                // Moves to the right if isToggled is true, or to the left if false.
                .offset(x: isToggled ? 10 : -10)
        }
        // Adding a tap gesture to the whole toggle area.
        // When tapped, it toggles the state with a smooth linear animation over 0.25 seconds.
        .onTapGesture {
            withAnimation(Animation.linear(duration: 0.25)) {
                isToggled.toggle()
            }
        }
    }
}

// The preview for CustomToggle using the new @Previewable macro.
// A local @State variable is created for interactive testing.
#Preview {
    // The @Previewable attribute along with a @State variable allows the preview to be interactive.
    @Previewable @State var isToggled = false
    // The binding is passed to CustomToggle so that changes update the preview state.
    CustomToggle(isToggled: $isToggled)
}
