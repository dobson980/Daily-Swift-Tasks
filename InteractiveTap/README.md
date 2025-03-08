# InteractiveTap

## Overview
**InteractiveTap** is a SwiftUI project demonstrating how to create interactive tap animations using `sensoryFeedback`, `onTapGesture`, and `withAnimation`. The project enhances user interaction by providing both visual scaling effects and haptic feedback.

## Features
- Uses `@State` to track tap-triggered animations.
- Applies `sensoryFeedback(.success)` for haptic feedback on tap.
- Animates text scaling with `withAnimation` for smooth transitions.
- Implements `Task.sleep` to delay the reset animation.

## Code Breakdown

### 🎛️ Managing Tap Feedback and Scaling
Two `@State` properties track the animation state:

```swift
@State private var feedback = false
@State private var scale = 1.0
```

### 🔄 Implementing Tap Gesture with Animation
Tapping the text triggers a scale-up effect, followed by a return to the original size:

```swift
Text("Hello, world!")
    .font(.system(size: 50))
    .fontWeight(.heavy)
    .scaleEffect(scale)
    .foregroundStyle(Gradient(colors: [.red, .blue]))
    .sensoryFeedback(.success, trigger: feedback)
    .onTapGesture {
        feedback.toggle()
        withAnimation(.easeInOut(duration: 0.2)) {
            scale = 1.5 // Enlarges the text.
        }
        Task {
            try await Task.sleep(for: .seconds(0.2))
            withAnimation(.easeInOut(duration: 0.2)) {
                scale = 1.0 // Restores the original size.
            }
        }
    }
    .animation(.bouncy, value: scale)
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **InteractiveTap.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap the text to see the animation and haptic feedback.

## Notes
- `sensoryFeedback(.success, trigger: feedback)` provides haptic feedback on tap.
- The use of `withAnimation(.easeInOut)` ensures a smooth scale transition.
- `Task.sleep(for: .seconds(0.2))` introduces a delay before restoring the original size.
- The `.bouncy` animation modifier enhances the overall interaction feel.

---
🚀 *Part of the Daily Swift Tasks learning journey!*