# ButtonPress

## Overview
**ButtonPress** is a SwiftUI project demonstrating how to create a tappable circular button with responsive animation and visual styling. The button features a vibrant angular gradient, layered shadows for depth, and a scale animation when tapped.

## Features
- Uses `AngularGradient` to create a dynamic, rotating color fill.
- Adds layered shadows for a modern, elevated appearance.
- Implements a tap gesture with a brief scaling animation for tactile feedback.
- Includes `Task.sleep` for a subtle timing delay during animation.

## Code Breakdown

### 🟣 Circular Button with Gradient Fill

```swift
Circle()
    .fill(
        AngularGradient(
            gradient: Gradient(colors: [.blue, .purple, .pink, .blue]),
            center: .center
        )
    )
    .frame(width: 150, height: 150)
```

- The `AngularGradient` rotates through the colors to create a dynamic look.
- The circle has a fixed size of 150x150 points.

### 🧩 Stroke and Shadow Effects

```swift
.overlay(
    Circle()
        .stroke(Color.white, lineWidth: 4)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
)
.shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
```

- A white stroke overlays the circle with a soft shadow.
- An additional shadow adds depth beneath the entire button.

### 💥 Tap Animation with Feedback

```swift
.onTapGesture {
    Task {
        withAnimation {
            scale = 0.9
        }
        try await Task.sleep(nanoseconds: 50_000_000)
        withAnimation {
            scale = 1.0
        }
    }
}
```

- When tapped, the button quickly scales down and then springs back to its original size.
- The 50-millisecond pause ensures the animation feels snappy and responsive.

### 📱 Preview Support

```swift
#Preview {
    ButtonPressView()
}
```

- The `#Preview` macro allows live previews in Xcode.

## How to Run
1. Open **ButtonPress.xcodeproj** in Xcode.
2. Select a simulator or device.
3. Run the app (`Cmd + R`) and tap the circular button to see the animation in action.

## Notes
- The use of `Task.sleep` combined with `withAnimation` enables precise, responsive user interactions.
- This button style is ideal for touch-heavy interfaces like games, dashboards, or control panels.

---

🚀 *Part of the Daily Swift Tasks learning journey!*
