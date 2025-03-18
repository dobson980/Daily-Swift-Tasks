//
//  ContentView.swift
//  ErrorBanner
//
//  Created by Thomas Dobson on 3/17/25.
//

import SwiftUI

// ContentView demonstrates how to use the ActivityIndicator (spinner) within a UI.
// It includes a button to toggle the loading state and triggers a continuous rotation animation when loading.
struct ContentView: View {
    // State variable that indicates whether the loading indicator should animate.
    @State private var isLoading = false
    // State variable used to control the rotation angle of the ActivityIndicator.
    @State private var rotationAngle: Double = 0

    var body: some View {
        VStack {
            Spacer() // Pushes the content toward the center of the screen.
            
            // The ActivityIndicator view is displayed here.
            // Its rotation is modified by the current rotationAngle, which is updated by an animation.
            ActivityIndicator(isAnimating: $isLoading)
                .rotationEffect(.degrees(rotationAngle))
                // The onChange modifier monitors changes to isLoading.
                // When isLoading becomes true, it triggers a repeating animation that rotates the indicator.
                .onChange(of: isLoading) { oldValue, newValue in
                    if newValue {
                        // When loading starts, animate rotationAngle from 0 to 360 degrees using a linear, repeating animation.
                        withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                            rotationAngle = 360
                        }
                    } else {
                        // When loading stops, reset the rotation angle immediately to 0.
                        rotationAngle = 0
                    }
                }
            
            Spacer() // Adds vertical space below the indicator.
            
            // A button to toggle the loading state.
            // Tapping the button will toggle isLoading, which in turn starts or stops the animation.
            Button {
                isLoading.toggle()
            } label: {
                Text("Load Data")
            }
            .buttonStyle(.borderedProminent) // Uses a prominent bordered style for better visual appearance.
        }
        .padding() // Adds padding around the entire content.
    }
}

// A preview for ContentView to allow interactive testing in Xcode's canvas.
#Preview {
    ContentView()
}
