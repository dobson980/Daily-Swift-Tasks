# ShapeAnimations

## Overview
**ShapeAnimations** is a SwiftUI project demonstrating how to animate shape transformations using `rotationEffect` and `@State` properties. This project focuses on smoothly rotating a rectangle when a button is pressed.

![shape animatio](https://github.com/user-attachments/assets/127463d8-458c-497b-97c1-3e8a4773b57f)

## Features
- Uses `@State` to track the rotation angle of a shape.
- Animates a `Rectangle` using `rotationEffect` and `easeInOut` animation.
- Rotates the shape by 90 degrees on each button press.
- Implements a simple UI with a button for user interaction.

## Code Breakdown

### 🌀 Creating the Animated Shape
The `Rectangle` rotates based on the `rotation` state variable:

```swift
Rectangle()
    .frame(width: 150, height: 150) // Sets the rectangle’s size.
    .rotationEffect(rotation) // Applies the rotation based on the `rotation` state.
    .animation(.easeInOut(duration: 1), value: rotation) // Smoothly animates the rotation changes.
```

### 🖲️ Handling Button Press to Animate
The button increments the `rotation` angle by 90 degrees each time it is pressed:

```swift
Button {
    rotation += Angle(degrees: 90) // Rotates the rectangle 90 degrees on each press.
} label: {
    Text("Animate Me") // The text displayed on the button.
}
.buttonStyle(.borderedProminent) // Applies a prominent button style.
```

### 🔄 Managing Rotation with State
The `@State` property ensures the UI updates smoothly with animations:

```swift
@State private var rotation: Angle = .zero
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **ShapeAnimations.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the shape rotation in action.

## Notes
- `rotationEffect` is a powerful SwiftUI modifier for rotating views.
- `easeInOut` animation ensures smooth and visually appealing transitions.
- The `Spacer` elements help in maintaining a balanced UI layout.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
