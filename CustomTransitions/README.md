# CustomTransitions

## Overview
**CustomTransitions** is a SwiftUI project demonstrating how to animate text transitions using opacity and position changes. The project features a button-triggered animation that reveals a "SURPRISE!" message with a smooth fade-in and movement effect.

## Features
- Uses `@State` properties to control opacity and vertical position.
- Implements a smooth transition using `withAnimation(.linear(duration: 3))`.
- Prevents repeated interactions while the animation is in progress.
- Toggles between showing and hiding the text with a reset mechanism.
- Uses Swift’s `Task.sleep` for asynchronous animation handling.

## Code Breakdown

### 🎭 Animating the Text Appearance
The `"SURPRISE!"` text appears by changing its opacity and position:

```swift
Text("SURPRISE!")
    .font(.system(size: 55, weight: .bold, design: .default)) // Large, bold font.
    .offset(y: pos) // Adjusts the vertical position.
    .opacity(opacity) // Adjusts the opacity.
    .foregroundStyle(.indigo) // Sets the text color.
```

### 🔘 Creating the Toggle Button
A button triggers the animation and toggles between "Reset" and "What does this do?":

```swift
Button(reset ? "Reset" : "What does this do?") {
    animateSurprise()
}
.disabled(isAnimating) // Disables the button while the animation is running.
.buttonStyle(.borderedProminent) // Applies a prominent button style.
.font(.largeTitle) // Sets a large font size for the button text.
```

### 🔄 Handling the Animation Logic
The `animateSurprise` function controls the fade-in and movement effect:

```swift
func animateSurprise() {
    if reset {
        self.opacity = 0.0
        self.pos = -500
        reset.toggle() // Resets the state.
    } else {
        isAnimating = true
        withAnimation(.linear(duration: 3)) {
            self.opacity = 1.0 // Fades in the text.
            self.pos = 0 // Moves the text to the center.
        }
        Task {
            try await Task.sleep(for: .seconds(3)) // Waits for animation completion.
            isAnimating = false
            reset.toggle()
        }
    }
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
1. Open **CustomTransitions.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the animated text transition.

## Notes
- `withAnimation(.linear(duration: 3))` creates a smooth text reveal effect.
- The `Task.sleep` function ensures proper timing before resetting the animation.
- `isAnimating` prevents multiple button presses while the animation runs.

---
🚀 *Part of the Daily Swift Tasks learning journey!*