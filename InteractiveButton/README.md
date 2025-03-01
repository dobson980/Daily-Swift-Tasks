# InteractiveButton

## Overview
**InteractiveButton** is a SwiftUI project demonstrating how to create an animated button using `scaleEffect` and asynchronous state management. This project features a button that scales up when tapped and smoothly returns to its original size.

![animatedButton](https://github.com/user-attachments/assets/7f0f29b8-7703-4341-8964-031b727ee697)

## Features
- Uses `@State` to track the button’s scale.
- Implements an animated scaling effect when the button is pressed.
- Uses `Task.sleep` to introduce delays for a smooth animation.
- Prevents repeated taps while the animation is in progress.

## Code Breakdown

### 🎛️ Managing Button Scale with State
Two state variables track the animation state and scale value:

```swift
@State private var buttonScale: CGFloat = 1.0
@State private var isAnimating: Bool = false
```

### 🔘 Creating the Interactive Button
The button triggers an animation when tapped, using `Task` for async execution:

```swift
Button {
    Task {
        await scaleButton() // Calls the asynchronous animation function.
    }
} label: {
    Text("Press Me") // Button label text.
        .font(.system(size: 35))
}
.buttonStyle(.borderedProminent) // Uses a prominent button style.
.disabled(isAnimating) // Prevents interaction while animating.
.scaleEffect(buttonScale) // Applies the scaling effect.
```

### 🔄 Implementing the Scale Animation
The button smoothly scales up and returns to normal using `withAnimation`:

```swift
func scaleButton() async {
    isAnimating = true // Disables button interaction.
    withAnimation(.easeIn) {
        buttonScale = 1.5 // Enlarges the button.
    }
    try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s delay.
    withAnimation(.easeOut) {
        buttonScale = 1.0 // Returns to original size.
    }
    try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s delay.
    isAnimating = false // Re-enables button interaction.
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **InteractiveButton.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to test the animated button.

## Notes
- `scaleEffect` is used to smoothly animate the button’s size.
- `Task.sleep` introduces delays, preventing instant resets.
- `isAnimating` ensures smooth interaction by disabling the button during the animation.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
