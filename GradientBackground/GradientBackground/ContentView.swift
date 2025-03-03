//
//  ContentView.swift
//  GradientBackground
//
//  Created by Thomas Dobson on 3/3/25.
//

import SwiftUI

// The main view that presents a TabView with different gradient types.
struct ContentView: View {
    var body: some View {
        
        TabView {
            // The first tab shows a Linear Gradient.
            Tab("Linear", systemImage: "line.diagonal.arrow") {
                // Using the generic GradientView to display a linear gradient.
                GradientView(
                    gradient: LinearGradient(
                        gradient: Gradient(
                            colors: [.blue, .green, .orange]),
                        startPoint: .bottom,
                        endPoint: .top),
                    gradientType: "Linear")
            }
            
            // The second tab shows a Radial Gradient.
            Tab("Radial", systemImage: "circle.dashed") {
                // Using the same GradientView, but with a different gradient type.
                GradientView(
                    gradient: RadialGradient(
                        colors: [.blue, .green, .orange],
                        center: .center,
                        startRadius: 400,
                        endRadius: 20),
                    gradientType: "Radial")
            }
        }
        .accentColor(.white) // Sets the accent color for the tab icons.
        .onAppear() {
            UITabBar.appearance().barStyle = .black // Ensures the tab bar background is black.
        }
    }
}

// A reusable generic view that renders a gradient with a label overlay.
struct GradientView<Gradient: View>: View {
    // Stores the gradient view. The generic type allows flexibility (e.g., LinearGradient, RadialGradient).
    let gradient: Gradient
    // Stores the descriptive string for the gradient type.
    let gradientType: String
    
    var body: some View {
        ZStack {
            // The gradient is rendered as the background.
            gradient
                .ignoresSafeArea() // Ensures the gradient covers the entire screen, ignoring safe area insets.
            VStack {
                // A text overlay showing the type of gradient.
                Text("\(gradientType) Gradient")
                    .foregroundStyle(.white) // Makes the text white to contrast against the gradient.
                    .font(.largeTitle) // Sets a large font size.
            }
            .padding() // Adds padding around the VStack content.
        }
    }
}

// A preview provider to display ContentView in Xcode’s preview canvas.
#Preview {
    ContentView()
}
