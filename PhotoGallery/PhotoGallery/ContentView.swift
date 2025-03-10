//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

struct ContentView: View {
    // Define a grid layout with adaptive columns.
    // Each column will be at least 200 points wide, and SwiftUI will determine how many columns can fit.
    let columns = [GridItem(.adaptive(minimum: 200))]
    
    var body: some View {
        // Wrap the grid in a ScrollView to allow scrolling when the content exceeds the screen height.
        ScrollView {
            // LazyVGrid efficiently loads the views as they appear on the screen.
            LazyVGrid(columns: columns) {
                // Create a grid item for each index from 1 to 14.
                ForEach(1..<15, id: \.self) { index in
                    // Display the GalleryItem view, passing the current index as the imageIndex.
                    GalleryItem(imageIndex: index)
                }
            }
            // Add padding around the grid for better layout and spacing.
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
