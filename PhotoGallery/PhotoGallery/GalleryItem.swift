//
//  GalleryItem.swift
//  PhotoGallery
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

struct GalleryItem: View {
    // The imageIndex is used to reference a specific image asset.
    // It's converted to a String to dynamically load the image.
    var imageIndex: Int
    
    var body: some View {
        // Create an image view using the imageIndex.
        Image("\(imageIndex)")
            // Make the image resizable to adapt to different container sizes.
            .resizable()
            // Scale the image to fill its container. This might crop parts of the image if the aspect ratios differ.
            .scaledToFill()
            // Clip the image to a rounded rectangle shape with a 25-point corner radius,
            // giving the image smooth, rounded corners.
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    GalleryItem(imageIndex: 1)
}
