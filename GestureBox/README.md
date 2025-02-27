# GestureBox

## Overview
**GestureBox** is a SwiftUI project that demonstrates interactive gesture handling. The app includes a draggable and tappable box that changes color when tapped and moves in response to drag gestures.

![draggablebox](https://github.com/user-attachments/assets/907b1810-fc09-4994-9246-709ae60af8a7)

## Features
- Uses `DragGesture` to move the box around the screen.
- Implements `onTapGesture` to randomly change the box's color.
- Uses `@GestureState` for smooth real-time dragging.
- Ensures the box never selects the same color twice in a row.

## Code Breakdown

### 🏗️ Creating the Draggable Box
The box is a simple `Rectangle` that responds to gestures:

```swift
Rectangle()
    .frame(width: 75, height: 75)
    .foregroundColor(boxColor)
    .offset(x: currentOffset.width + offset.width, y: currentOffset.height + offset.height)
```

### ✋ Handling Drag Gestures
The `DragGesture` updates the offset in real-time while dragging and saves the final position when the user stops:

```swift
.gesture(
    DragGesture()
        .updating($offset) { current, state, _ in
            state = current.translation
        }
        .onEnded { final in
            currentOffset.width += final.translation.width
            currentOffset.height += final.translation.height
        }
)
```

### 🎨 Changing Colors on Tap
The `onTapGesture` calls `pickColor()` to select a new random color:

```swift
.onTapGesture {
    pickColor(currentColor: boxColor)
}
```

The `pickColor()` function ensures the box never picks the same color twice in a row:

```swift
func pickColor(currentColor: Color) {
    let colors: [Color] = [.red, .green, .blue, .yellow, .brown, .orange, .pink, .purple]
    var newColor = colors.randomElement()
    while newColor == currentColor {
        newColor = colors.randomElement()
    }
    boxColor = newColor ?? .black
}
```

## How to Run
1. Open **GestureBox.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and interact with the box by dragging and tapping.

## Notes
- `DragGesture` provides smooth movement without directly modifying `@State`.
- The color change ensures a different color is always picked.
- Possible improvements include adding animations or constraints to limit movement.

---

🚀 *Part of the Daily Swift Tasks learning journey!*
