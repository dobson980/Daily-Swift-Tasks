//
//  ColoredBackground.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Full-screen background that fills the view with a single color.
///
/// This is kept as a tiny, reusable view so any screen can opt in to
/// a solid color background without repeating the layout modifiers.
struct ColoredBackground: View {
    /// The color used to fill the entire screen.
    let color: Color
    
    var body: some View {
        Rectangle()
            // Extend the rectangle under the safe areas so it truly
            // covers the whole screen behind system bars.
            .ignoresSafeArea()
            .foregroundStyle(color)
    }
}

#Preview {
    ColoredBackground(color: .black)
}
