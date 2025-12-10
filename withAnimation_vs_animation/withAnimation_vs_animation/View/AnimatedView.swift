//
//  SwiftUIView.swift
//  withAnimation_vs_animation
//
//  Created by Tom Dobson on 12/9/25.
//

import SwiftUI

/// Demonstrates using the `.animation(_:, value:)` view modifier.
///
/// Here each `Rectangle` has an animation attached directly to it.
/// Whenever `smallViews` changes, SwiftUI implicitly animates the
/// affected properties (the width in this case) to their new values.
struct AnimatedView: View {
    
    /// Tracks whether the rectangles should be "small" or "large".
    ///
    /// Toggling this value drives the width change that we animate.
    @State private var smallViews: Bool = true
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // Red rectangle that animates its width when `smallViews` changes.
            Rectangle()
                .fill(.red)
                .frame(width: smallViews ? 200 : 100, height: 100)
                // Implicit animation: SwiftUI animates from the old
                // width to the new width using this easing curve.
                .animation(.easeInOut, value: smallViews)

            // Blue rectangle uses the same animation and state.
            Rectangle()
                .fill(.blue)
                .frame(width: smallViews ? 200 : 100 , height: 100)
                .animation(.easeInOut, value: smallViews)
            
            Spacer()
            
            // Button simply toggles the state; no animation is
            // specified here. The animation lives on the views above.
            Button("Animate") {
                smallViews.toggle()
            }
            .buttonStyle(.glassProminent)
            .tint(.orange)
        }
        .padding()
    }
}

/// Preview for experimenting with the implicit animation approach.
#Preview {
    AnimatedView()
}
