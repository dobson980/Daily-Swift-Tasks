//
//  BlueView.swift
//  SegmentSwiper
//
//  Created by Thomas Dobson on 4/2/25.
//
//  This file defines the BlueView struct which is a SwiftUI view for displaying
//  a blue-themed tab content. Detailed comments are provided for later review.

import SwiftUI

/// A view that displays a blue-themed tab with a title text.
/// 
/// The view uses a gradient background composed of blue colors. It makes the text large,
/// sets its color to white, and configures the view to fill the entire available space,
/// ignoring safe area insets.
struct BlueView: View {
    
    /// The content and behavior of the view.
    ///
    /// The view displays a text "Blue Tab Content" with a large title font and white font color.
    /// The text is centered in a frame that expands to both maximum width and height.
    /// A blue gradient background is applied and the view ignores the safe area to cover the whole screen.
    var body: some View {
        Text("Blue Tab Content")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Gradient(colors: [.blue, .blue.opacity(0.7)])
            )
            .ignoresSafeArea()
    }
}

#Preview {
    BlueView()
}
