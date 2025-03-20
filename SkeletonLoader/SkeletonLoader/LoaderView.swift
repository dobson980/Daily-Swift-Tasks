//
//  LoaderView.swift
//  SkeletonLoader
//
//  Created by Thomas Dobson on 3/19/25.
//  This file contains the LoaderView component that displays a rounded rectangle with
//  a shimmer animation effect. The shimmer effect is achieved by overlaying a linear gradient
//  which animates across the shape.
//
//  The LoaderView uses SwiftUI’s GeometryReader to dynamically adjust the width of the gradient overlay.

import SwiftUI

/// A view that represents a loader with a shimmer animation effect.
/// The animation creates a shimmering visual on a rounded rectangle by moving a linear gradient over it.
struct LoaderView: View {
    /// A state variable that holds the horizontal offset for the shimmering gradient animation.
    /// The gradient starts off-screen to the left and animates to off-screen to the right.
    @State private var gradientOffset: CGFloat = 0
    
    /// The main content view that displays the shimmer effect on a rounded rectangle.
    var body: some View {
        // A rounded rectangle acting as the base shape with a light gray fill.
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.3))
            .overlay {
                // Use GeometryReader to obtain the size of the rounded rectangle.
                GeometryReader { geometry in
                    // Retrieve the width of the current view.
                    let width = geometry.size.width
                    // Overlay another rounded rectangle with a linear gradient fill to create the shimmer effect.
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            // Define the gradient with stops to create a narrow highlight effect.
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    // The gradient starts with a clear color.
                                    .init(color: Color.clear, location: 0.0),
                                    // A semi-transparent white color appears at the middle for the shimmer highlight.
                                    .init(color: Color.white.opacity(0.6), location: 0.5),
                                    // The gradient ends with a clear color.
                                    .init(color: Color.clear, location: 1.0)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        // Set the frame width to match the width of the base shape.
                        .frame(width: width)
                        // Apply a horizontal offset to animate the gradient across the shape.
                        .offset(x: gradientOffset)
                        // Use a mask to constrain the gradient within the rounded rectangle boundaries.
                        .mask(RoundedRectangle(cornerRadius: 10))
                        .onAppear {
                            // Begin the animation by starting the gradient offset off-screen to the left.
                            gradientOffset = -width
                            // Animate the gradient to move across the shape continuously.
                            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                                gradientOffset = width
                            }
                        }
                }
            }
            // Add padding around the view.
            .padding()
    }
}

/// A preview provider for LoaderView to enable live previews in Xcode.
#Preview {
    LoaderView()
}
