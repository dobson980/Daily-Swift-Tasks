//
//  ContentView.swift
//  ShapePlayground
//
//  Created by Thomas Dobson on 2/26/25.
//

import SwiftUI

// The main view of the application that demonstrates triangle shapes and transformations.
struct ContentView: View {
    var body: some View {
        // A vertical stack containing two rows of triangles.
        VStack(spacing: 0) {
            // First row of triangles.
            HStack(spacing: 0) {
                // Creates a red triangle on the left.
                let redTriangle = createTrianglePath()
                redTriangle
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                
                // Creates a blue triangle on the right, horizontally flipped.
                let blueTriangle = createTrianglePath()
                    .applying(CGAffineTransform(scaleX: -1, y: 1)
                    .concatenating(CGAffineTransform(translationX: 50, y: 0)))
                blueTriangle
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
            }
            
            // Second row of triangles.
            HStack(spacing: 0) {
                // Creates a red triangle on the left, flipped vertically.
                let redFlippedTriangle = createTrianglePath()
                    .applying(CGAffineTransform(scaleX: 1, y: -1)
                    .concatenating(CGAffineTransform(translationX: 0, y: 50)))
                redFlippedTriangle
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                
                // Creates a blue triangle on the right, flipped both horizontally and vertically.
                let blueFlippedTriangle = createTrianglePath()
                    .applying(CGAffineTransform(scaleX: -1, y: -1)
                    .concatenating(CGAffineTransform(translationX: 50, y: 50)))
                blueFlippedTriangle
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
            }
        }
    }
    
    // A reusable function that returns a triangular path.
    func createTrianglePath() -> Path {
        Path { path in
            // Starts at the bottom-left corner.
            path.move(to: CGPoint(x: 0, y: 0))
            // Draws a line to the top-right corner.
            path.addLine(to: CGPoint(x: 50, y: 50))
            // Draws a line back to the bottom-right corner.
            path.addLine(to: CGPoint(x: 0, y: 50))
            // Closes the path to form a triangle.
            path.closeSubpath()
        }
    }
}

// A preview provider for Xcode’s canvas to see ContentView in action.
#Preview {
    ContentView()
}
