//
//  Header.swift
//  ParallaxHeader
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

struct Header: View {
    var body: some View {
        // The GeometryReader gives us access to the view's size and position.
        GeometryReader { geometry in
            // Calculate the vertical offset (minY) of the header in global coordinates.
            // This value changes as the header scrolls.
            let yOffset = geometry.frame(in: .global).minY
            
            // The header image with dynamic offset to create a parallax effect.
            Image("space")
                .resizable()
                .scaledToFill()
                // Make sure the image fills the header frame.
                .frame(width: geometry.size.width, height: geometry.size.height + (yOffset > 0 ? yOffset : 0))
                // Apply an offset based on the scroll position.
                // If yOffset is positive (pulled down), move the image up by the same amount.
                .offset(y: yOffset > 0 ? -yOffset : 0)
                // Clip the image to prevent overflow.
                .clipped()
        }
        // Set a fixed height for the header.
//        .frame(height: 300)
    }
}

#Preview {
    Header()
}
