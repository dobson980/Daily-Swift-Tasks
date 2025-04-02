//
//  Spinner.swift
//  AnimatedAsyncButton
//
//  Created by Thomas Dobson on 4/2/25.
//

import SwiftUI

/// A view that displays an animated circular spinner.
///
/// The spinner creates a layered rotation effect by drawing a full circle with a faded
/// stroke and an arc with a solid stroke. The arc and additional rotation are animated
/// to produce a dynamic spinning appearance.
struct Spinner: View {
    /// The color used for the spinner's primary tint.
    var tint: Color
    
    /// The width of the spinner's stroke.
    var lineWidth: CGFloat = 4
    
    /// The current rotation angle for the primary animation.
    @State private var rotation: Double = 0
    
    /// The additional rotation angle for the secondary animation.
    @State private var extraRotation: Double = 0
    
    /// A trigger used to start the animations when the view appears.
    @State private var triggerAnimation: Bool = false
    
    /// The body of the spinner view.
    ///
    /// It composes two circles layered on top of each other:
    /// - A background circle with a faded tint.
    /// - A foreground arc (a trimmed circle) with full tint that is animated.
    var body: some View {
        ZStack {
            // Background circle with reduced opacity for a subtle effect.
            Circle()
                .stroke(tint.opacity(0.3), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
            
            // Foreground arc representing the spinner.
            // The arc is trimmed to 30% of the circle and animated using two rotation effects.
            Circle()
                .trim(from: 0, to: 0.3)
                .stroke(tint, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(rotation))
                .rotationEffect(.degrees(extraRotation))
        }
        .compositingGroup()
        // Trigger the animation when the view appears.
        .onAppear(perform: animate)
    }
    
    /// Animates the spinner's rotation.
    ///
    /// This function launches two concurrent animations:
    /// 1. A fast, repeating rotation of the arc by 360 degrees.
    /// 2. A secondary rotation with a slight delay to create an overlapping motion effect.
    private func animate() {
        triggerAnimation.toggle()
        
        // Primary rotation animation applied to `rotation`.
        withAnimation(
            .linear(duration: 0.7)
            .speed(1.2)
            .repeatForever(autoreverses: false)
        ) {
            rotation += 360
        }
        
        // Secondary rotation animation applied to `extraRotation`, starts after a delay.
        withAnimation(
            .linear(duration: 1)
            .speed(1.2)
            .delay(1)
            .repeatForever(autoreverses: false)
        ) {
            extraRotation += 360
        }
    }
}

/// A preview provider for the `Spinner` view.
///
/// This preview displays a green spinner with a line width of 4 and a frame of 30 x 30.
#Preview {
    Spinner(tint: .green, lineWidth: 4.0)
        .frame(width: 30, height: 30)
}
