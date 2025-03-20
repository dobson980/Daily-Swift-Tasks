//
//  ContentView.swift
//  SkeletonLoader
//
//  Created by Thomas Dobson on 3/19/25.
//

import SwiftUI

/// The main view presenting a loader and accompanying text message.
/// This view integrates the `LoaderView` component and displays a placeholder text.
/// The `gradientOffset` state variable is defined for potential future animation usage.
struct ContentView: View {
    /// A state variable to track the horizontal offset for a gradient animation.
    /// Currently, it is not utilized in the view's body.
    @State private var gradientOffset: CGFloat = 0
    
    /// The content and layout of the view.
    /// Displays the loader view followed by a descriptive text message.
    var body: some View {
        // A vertical stack to arrange elements vertically.
        VStack {
            // Displays the loader animation view.
            LoaderView()
            
            // Displays a text message with a system font of size 30.
            Text("It might load eventually...")
                .font(.system(size: 30))
        }
    }
}

/// A preview provider for `ContentView` to enable live previews in Xcode.
#Preview {
    ContentView()
}
