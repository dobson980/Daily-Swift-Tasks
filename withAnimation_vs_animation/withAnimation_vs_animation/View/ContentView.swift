//
//  ContentView.swift
//  withAnimation_vs_animation
//
//  Created by Tom Dobson on 12/9/25.
//

import SwiftUI

/// Root view for the demo.
///
/// Presents a `TabView` with two tabs so you can easily switch
/// between the `.animation(_:, value:)` approach and the
/// `withAnimation(_:_:)` approach and see how they differ.
struct ContentView: View {
    
    /// Unused example state variable.
    ///
    /// This was part of an earlier experiment and is left here to
    /// highlight that *only* the state values referenced by a view's
    /// modifiers will affect animations.
    @State private var smallViews = true
    
    var body: some View {
        
        TabView {
            // First tab shows implicit animations via `.animation`.
            Tab("Animated", systemImage: "sparkles") {
                AnimatedView()
            }

            // Second tab shows explicit animations via `withAnimation`.
            Tab("withAnimation", systemImage: "wand.and.stars") {
                WithAnimation()
            }
        }
    }
}

/// Xcode preview for quickly iterating on the tab layout.
#Preview {
    ContentView()
}
