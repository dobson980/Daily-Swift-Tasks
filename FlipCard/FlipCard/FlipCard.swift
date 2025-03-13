//
//  FlipCard.swift
//  FlipCard
//
//  Created by Thomas Dobson on 3/12/25.
//

import SwiftUI

// FlipCard is a reusable view that displays a card which can flip between a front and back side.
// The isFlipped binding controls whether the card is showing its front or back side.
struct FlipCard: View {
    // Binding variable to track the card's flip state.
    // When isFlipped is true, the back is visible; when false, the front is visible.
    @Binding var isFlipped: Bool

    var body: some View {
        // ZStack is used to overlay the front and back views on top of each other.
        ZStack {
            // Front View: This view is shown when the card is not flipped.
            ZStack {
                // RoundedRectangle acts as the card's background.
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white) // Background color for the front.
                    .frame(width: 250, height: 400) // Fixed dimensions for the card.
                    .overlay(
                        // An overlay that adds a border to the card.
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 4)
                    )
                // The text for the front side of the card.
                Text("Front")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundStyle(Gradient(colors: [.blue, .green])) // Gradient styling for text.
            }
            // The front view is fully visible (opacity 1) when the card is not flipped,
            // and hidden (opacity 0) when flipped.
            .opacity(isFlipped ? 0 : 1)
            // Apply a 3D rotation effect to the front view:
            // When isFlipped is false, it is at 0°; when true, it rotates to 180°.
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            
            // Back View: This view is shown when the card is flipped.
            ZStack {
                // RoundedRectangle acts as the card's background for the back.
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray6)) // Softer background color for the back.
                    .frame(width: 250, height: 400)
                    .overlay(
                        // An overlay that adds a border.
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 4)
                    )
                // The text for the back side of the card.
                Text("Back")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundStyle(Gradient(colors: [.orange, .red]))
            }
            // The back view is hidden (opacity 0) when the card is not flipped,
            // and fully visible (opacity 1) when it is flipped.
            .opacity(isFlipped ? 1 : 0)
            // Apply a 3D rotation effect to the back view:
            // When isFlipped is false, it is rotated -180° (hidden off-screen);
            // When true, it rotates to 0° (i.e. becomes visible).
            .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
        }
        // When tapped, it toggles the flip state with a smooth animation.
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isFlipped.toggle()
            }
        }
    }
}

// Interactive preview for FlipCard using the new @Previewable macro.
// A local @State variable is used to simulate the flip behavior in the preview.
#Preview {
    @Previewable @State var flipped = false
    FlipCard(isFlipped: $flipped)
}
