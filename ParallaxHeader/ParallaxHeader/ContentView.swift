//
//  ContentView.swift
//  ParallaxHeader
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

struct ContentView: View {
    // A state variable that tracks the vertical scroll offset.
    // This value is updated as the user scrolls.
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        // ZStack layers views on top of one another.
        // Alignment is set to .top so that the content aligns to the top edge.
        ZStack(alignment: .top) {
            // Underlay: A black background that fills the entire screen.
            // This ensures that if any gaps appear, they are filled with black.
            Color.black
                .ignoresSafeArea() // Extends the color to cover the full screen, including safe areas.
            
            // Background Layer: Contains the parallax image.
            GeometryReader { geo in
                // The image named "space" is loaded from assets.
                Image("space")
                    .resizable()         // Allows the image to be resized.
                    .scaledToFill()      // Scales the image to fill the available space (may crop parts of it).
                    // The frame is set to be as wide as the screen and much taller than the screen.
                    // Multiplying the height by 3.0 makes the image very tall so it always covers the screen.
                    .frame(width: geo.size.width, height: geo.size.height * 3.0)
                    // Apply a vertical offset for the parallax effect:
                    // When scrolling upward (scrollOffset is negative), move the image upward at 30% of the scroll offset.
                    // When pulling down (positive offset), the image remains fixed.
                    .offset(y: scrollOffset < 0 ? scrollOffset * 0.3 : 0)
                    .clipped()           // Cuts off any parts of the image that overflow its frame.
                    .ignoresSafeArea()   // Ensures the image extends behind all safe areas.
            }
            
            // Foreground Scroll: The scrollable content displayed over the background.
            ScrollView {
                // A hidden GeometryReader to track how far the user has scrolled.
                // It does not display any content itself (height is set to 0).
                GeometryReader { scrollGeo in
                    Color.clear
                        // onChange detects changes in the scroll position.
                        // It updates the scrollOffset state variable with the new vertical position.
                        .onChange(of: scrollGeo.frame(in: .global).minY) { oldValue, newValue in
                            scrollOffset = newValue
                        }
                }
                .frame(height: 0) // This view is invisible; it only provides the scroll offset.
                
                // VStack arranges the scrollable content vertically.
                VStack(spacing: 20) {
                    // ForEach creates 50 items (from 0 to 49).
                    ForEach(0..<50) { index in
                        Text("Item \(index)")
                            .foregroundColor(.white)      // Sets the text color to white.
                            .font(.headline)              // Uses the headline font style.
                            .padding()                    // Adds padding around the text.
                            .background(Color.black.opacity(0.5)) // Semi-transparent black background behind each item.
                            .cornerRadius(8)              // Rounds the corners of the background.
                    }
                }
                .padding(.top, 40)    // Adds extra space at the top so the content doesn't start right at the top edge.
                .padding(.horizontal) // Adds padding on the sides.
            }
        }
    }
}

#Preview {
    ContentView()
}
