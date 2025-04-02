//
//  OrangeView.swift
//  SegmentSwiper
//
//  Created by Thomas Dobson on 4/2/25.
//

import SwiftUI

/// A view that displays an orange-themed tab with centered text.
///
/// This view consists of a text element with a large title font and white text color.
/// The view is designed to take up the entire available screen area, applying a background
/// gradient made of an orange color and a slightly transparent variant of orange. It ignores
/// safe area insets to ensure the background fills the entire screen.
struct OrangeView: View {

    /// The body property that defines the content and layout of the view.
    ///
    /// It constructs a text view with the hardcoded string "Blue Tab Content" (which may be a placeholder).
    /// The text is styled with a large title font, white color, and is positioned within a frame that
    /// expands to the maximum available width and height. A gradient background using orange colors is applied.
    /// The view also ignores safe area constraints.
    var body: some View {
        Text("Blue Tab Content")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Gradient(colors: [.orange, .orange.opacity(0.7)])
            )
            .ignoresSafeArea()
    }
}

#Preview {
    OrangeView()
}
