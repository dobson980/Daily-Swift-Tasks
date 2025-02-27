//
//  MultiPhotoPicker.swift
//  PhotoPickerDemo
//
//  Created by Thomas Dobson on 7/3/24.
//

import SwiftUI
import PhotosUI

/// A SwiftUI view that allows users to pick multiple photos from their device.
/// The selected images are displayed in a scrollable vertical list.
struct MultiPhotoPicker: View {
    /// Stores the selected photo items from the PhotosPicker.
    @State private var selectedItems = [PhotosPickerItem]()
    
    /// Stores the loaded images from the selected photo items.
    @State private var selectedImages = [Image]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    // Displays the selected images in a vertical stack
                    ForEach(0..<selectedImages.count, id: \.self) { i in
                        selectedImages[i]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300) // Sets a fixed display size
                    }
                }
            }
            .toolbar {
                // Toolbar button to open the photo picker
                PhotosPicker("Select Image", selection: $selectedItems, matching: .images)
            }
            // Triggers when selectedItems changes (i.e., when new images are picked)
            .onChange(of: selectedItems) {
                Task {
                    selectedImages.removeAll() // Clears previous images
                    
                    // Iterates through selected items to load and display images
                    for item in selectedItems {
                        if let image = try? await item.loadTransferable(type: Image.self) {
                            selectedImages.append(image)
                        }
                    }
                }
            }
        }
    }
}

/// A preview provider for Xcode canvas.
#Preview {
    MultiPhotoPicker()
}
