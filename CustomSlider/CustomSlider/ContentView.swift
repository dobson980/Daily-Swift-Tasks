//
//  ContentView.swift
//  CustomSlider
//
//  Created by Thomas Dobson on 3/7/25.
//

import SwiftUI

// This is the main content view that displays the half-circle progress view
// and a slider to control the progress.
struct ContentView: View {
    // A state variable that tracks the current progress value (0.0 to 1.0).
    @State private var progress: Double = 0.0

    var body: some View {
        VStack {
            // The half-circle progress view shows progress visually as a curved bar.
            HalfCircleProgressView(progress: progress, totalSteps: 1000, minValue: 0, maxValue: 1)
            // A slider that updates the progress variable.
            Slider(value: $progress)
        }
        .padding()
    }
}

// A custom progress view that displays a half-circle progress indicator.
struct HalfCircleProgressView: View {
    var progress: CGFloat // Current progress value.
    var totalSteps: Int // The total number of steps to complete the progress.
    var minValue: CGFloat // The minimum value for progress.
    var maxValue: CGFloat // The maximum value for progress.

    // A computed property that normalizes progress within the min-max range.
    private var normalizedProgress: CGFloat {
        (progress - minValue) / (maxValue - minValue)
    }

    var body: some View {
        ZStack {
            // The background shape showing the full progress path.
            HalfCircleShape()
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.gray.opacity(0.3)) // Light gray to represent the uncompleted portion.
                .frame(width: 200, height: 100)

            // The trimmed shape showing the completed progress.
            HalfCircleShape().trim(from: 0.0, to: normalizedProgress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .indigo]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 200, height: 100)
        }
    }
}

// A custom shape that defines the half-circle path.
struct HalfCircleShape: Shape {
    // Creates a half-circle path.
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: Angle(degrees: 180), // Starts at the left.
            endAngle: Angle(degrees: 0),    // Ends at the right.
            clockwise: false
        )
        return path
    }
}

// A preview provider that shows the ContentView in Xcode’s canvas.
#Preview {
    ContentView()
}
