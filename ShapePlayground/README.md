# ShapePlayground

## Overview
**ShapePlayground** is a SwiftUI project that demonstrates how to create and manipulate triangle shapes using `Path` and `CGAffineTransform`. The app arranges triangles in a grid layout, applying transformations such as flipping and mirroring.

<img width="280" alt="image" src="https://github.com/user-attachments/assets/4643f8fe-6f5e-470c-b1f4-f1f19ac6ad96" />

## Features
- Uses `Path` to create a custom triangle shape.
- Applies `CGAffineTransform` to flip and mirror shapes.
- Uses `VStack` and `HStack` to arrange the triangles in a structured layout.
- Demonstrates basic shape manipulation in SwiftUI.

## Code Breakdown

### 🛠️ Creating a Triangle Shape
A reusable function, `createTrianglePath()`, generates a triangular `Path`:

```swift
func createTrianglePath() -> Path {
    Path { path in
        path.move(to: CGPoint(x: 0, y: 0))  // Bottom-left
        path.addLine(to: CGPoint(x: 50, y: 50)) // Top-right
        path.addLine(to: CGPoint(x: 0, y: 50)) // Bottom-right
        path.closeSubpath() // Closes the shape
    }
}
```

### 🔄 Applying Transformations
The project demonstrates how to:
- **Flip horizontally**: `CGAffineTransform(scaleX: -1, y: 1)`
- **Flip vertically**: `CGAffineTransform(scaleX: 1, y: -1)`
- **Flip both axes**: `CGAffineTransform(scaleX: -1, y: -1)`

Example:

```swift
let blueFlippedTriangle = createTrianglePath()
    .applying(CGAffineTransform(scaleX: -1, y: -1)
    .concatenating(CGAffineTransform(translationX: 50, y: 50)))
```

## How to Run
1. Open **ShapePlayground.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the triangle transformations in action.

## Notes
- The project showcases how transformations affect shape positioning.
- Future improvements could include user interactions, animations, or dynamic resizing.

---

🚀 *Part of the Daily Swift Tasks learning journey!*
