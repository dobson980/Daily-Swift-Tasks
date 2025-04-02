//
//  GreenView.swift
//  SegmentSwiper
//
//  Created by Thomas Dobson on 4/2/25.
//
//  This file defines the GreenView struct which is a SwiftUI view that displays a green-themed tab content.
//  The view presents a text element with a green gradient background that covers the entire screen.
//  Detailed comments are provided for later review.

import SwiftUI

/// A view that displays a green-themed tab with centered text.
///
/// This view shows a text element with a large title font and white foreground. It fills the entire available
/// screen space and applies a background with a gradient transitioning through green colors. The view is configured
/// to ignore safe area insets to cover the entire screen.
///
/// Usage:
///     GreenView() // renders a green themed full-screen view
struct GreenView: View {
    
    /// The body property that defines the view's content and layout.
    ///
    /// The view consists of a text element displaying "Blue Tab Content". The text is styled with a large title font,
    /// a white foreground color, and is positioned within a frame that expands to the maximum width and height available.
    /// A green gradient background is applied, where the gradient uses two shades of green (a solid green and a slightly
    /// transparent green). The view ignores safe area constraints to ensure the background covers the entire screen.
    var body: some View {
        Text("Blue Tab Content")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Gradient(colors: [.green, .green.opacity(0.7)])
            )
            .ignoresSafeArea()
    }
}

#Preview {
    GreenView()
}
