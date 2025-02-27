//
//  SinglePhotoPicker.swift
//  PhotoPickerDemo
//
//  Created by Thomas Dobson on 7/3/24.
//

import SwiftUI
import PhotosUI

/// A SwiftUI view that allows users to pick a single photo from their device.
/// The selected image is displayed in place of the default system image.
struct SinglePhotoPicker: View {
    /// Stores the selected photo item from the PhotosPicker.
    @State private var selectedItem: PhotosPickerItem?
    
    /// Stores the loaded image after selection.
    @State private var image: Image?
    
    var body: some View {
        VStack {
            // Photo picker button that displays either the selected image or a placeholder.
            PhotosPicker(
                selection: $selectedItem, // Binds the selected photo item
                matching: .images, // Restricts selection to images only
                photoLibrary: .shared() // Uses the shared photo library
            ) {
                (image ?? Image(systemName: "photo.artframe")) // Displays selected image or default icon
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                    .padding(.bottom, 40)
            }
            // Triggers when the selected item changes
            .onChange(of: selectedItem) {
                Task {
                    // Attempts to load the selected image
                    if let newImage = try? await selectedItem?.loadTransferable(type: Image.self) {
                        image = newImage
                    } else {
                        print("Failed to load image")
                    }
                }
            }
            
            // Informative text for users
            Text("Upload an Image")
        }
    }
}

/// A preview provider for Xcode canvas.
#Preview {
    SinglePhotoPicker()
}
