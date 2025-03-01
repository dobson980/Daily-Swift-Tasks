# ButtonAnimations

## Overview
**ButtonAnimations** is a SwiftUI project demonstrating how to create an interactive button with dynamic color changes and animations using `symbolEffect`.

## Features
- Uses `@State` to track and update the button's ring color.
- Applies SF Symbol rendering with `.palette` mode for multi-color effects.
- Implements a `.breathe` animation effect tied to the button’s color change.
- Utilizes a function to ensure a new color is randomly selected each time the button is pressed.

## Code Breakdown

### 🎨 Changing the Button's Ring Color
A state variable keeps track of the button’s ring color, which updates on tap:

```swift
@State private var buttonRingColor: Color = .orange
```

### 🔘 Button with Dynamic Color and Animation
The button changes its color and applies a smooth animation when pressed:

```swift
Button {
    buttonRingColor = changeColor(currentColor: buttonRingColor) // Changes the ring color on tap.
} label: {
    Image(systemName: "button.programmable")
        .font(.system(size: 156)) // Sets the symbol size.
        .symbolRenderingMode(.palette) // Enables multi-color rendering.
        .foregroundStyle(.black, buttonRingColor) // Applies a black base with a dynamic ring color.
}
.symbolEffect(.breathe, value: buttonRingColor) // Animates the button with a breathing effect.
```

### 🔄 Generating a New Random Color
A helper function ensures a new random color is selected, avoiding repetition:

```swift
func changeColor(currentColor: Color) -> Color {
    let availableColors: [Color] = [.blue, .green, .yellow, .red, .orange, .purple, .brown, .indigo, .mint]
    var newColor: Color

    repeat {
        newColor = availableColors.randomElement() ?? .red
    } while newColor == currentColor

    return newColor
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
1. Open **ButtonAnimations.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to test the interactive button.

## Notes
- `symbolEffect(.breathe, value:)` creates a smooth breathing animation.
- The `.palette` rendering mode allows SF Symbols to have multiple colors.
- The color change function prevents the same color from being selected twice in a row.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
