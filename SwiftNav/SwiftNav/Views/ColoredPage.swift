//
//  OrangePage.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Simple destination screen used for both the red and orange pages.
///
/// The layout is intentionally generic: a full-screen colored background
/// with a single glass button in the center that triggers the provided
/// action (usually navigating back to the root).
struct ColoredPage: View {
    /// Background fill color for the page.
    var backgroundColor: Color
    /// Text shown inside the central button.
    var buttonText: String
    /// Tint applied to the central button.
    var buttonColor: Color
    /// Action to perform when the user taps the button.
    var action: () -> Void
    
    var body: some View {
        ZStack {
            // Reuse the helper view to cover the whole screen.
            ColoredBackground(color: backgroundColor)
            // Button sits on top, styled with a glass effect.
            ColoredGlassButton(
                title: buttonText,
                color: buttonColor,
                glassStyle: .glass
            ) {
                action()
            }
        }
    }
}

#Preview {
    ColoredPage(backgroundColor: .green, buttonText: "Test", buttonColor: .orange) {}
}

