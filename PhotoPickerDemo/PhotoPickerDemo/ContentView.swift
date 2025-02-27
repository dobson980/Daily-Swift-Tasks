//
//  ContentView.swift
//  PhotoPickerDemo
//
//  Created by Thomas Dobson on 7/3/24.
//

import SwiftUI
import PhotosUI

/// The main view of the app, providing a tab-based navigation interface.
/// Users can switch between single and multi-photo pickers.
struct ContentView: View {
    
    var body: some View {
        TabView {
            // Tab for selecting a single photo
            Tab("SinglePhoto", systemImage: "photo") {
                SinglePhotoPicker()
            }
            
            // Tab for selecting multiple photos
            Tab("MultiPhoto", systemImage: "photo") {
                MultiPhotoPicker()
            }
        }
    }
}

/// A preview provider for Xcode canvas.
#Preview {
    ContentView()
}
