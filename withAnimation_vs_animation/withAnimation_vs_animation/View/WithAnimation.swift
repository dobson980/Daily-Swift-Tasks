//
//  WithAnimation.swift
//  withAnimation_vs_animation
//
//  Created by Tom Dobson on 12/9/25.
//

import SwiftUI

/// Demonstrates using `withAnimation(_:_:)` for explicit animations.
///
/// Instead of attaching `.animation` to each view, we wrap the state
/// change in `withAnimation`. Any animatable properties that depend on
/// that state will animate together using the specified duration and
/// easing.
struct WithAnimation: View {
    
    /// Controls whether the rectangles are currently "small" or "large".
    @State private var smallViews: Bool = true
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // Cyan rectangle whose width depends on `smallViews`.
            Rectangle()
                .fill(.cyan)
                .frame(width: smallViews ? 200: 100, height: 100)
            
            // Orange rectangle that follows the same rule.
            Rectangle()
                .fill(.orange)
                .frame(width: smallViews ? 200 : 100, height: 100)
            
            Spacer()
            
            // Here the animation is defined around the state change
            // instead of on the views. Any views that depend on
            // `smallViews` will animate their changes together.
            Button("Animate") {
                withAnimation(.easeInOut(duration: 1)) {
                    self.smallViews.toggle()
                }
            }
            .buttonStyle(.glassProminent)
            .tint(.indigo)
        }
        .padding()
    }
}

/// Preview for experimenting with the explicit `withAnimation` approach.
#Preview {
    WithAnimation()
}
