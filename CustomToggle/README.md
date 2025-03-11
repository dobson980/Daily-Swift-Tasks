# CustomToggle

## Overview
**CustomToggle** is a SwiftUI project demonstrating how to build a custom toggle switch using `@Binding`. This reusable component provides a simple, animated toggle UI that can be controlled by a parent view.

## Features
- Uses `@Binding` for two-way data flow between the toggle and its parent view.
- Implements a `ZStack` with a rounded rectangle as the track and a moving circle as the thumb.
- Animates state changes using `withAnimation(.linear(duration: 0.25))`.
- Supports interactive previews using `@Previewable` and `@State`.

## Code Breakdown

### 🔄 Managing Toggle State
The `@Binding` property allows external control over the toggle's state:

```swift
@Binding var isToggled: Bool
```

### 🎛️ Creating the Toggle UI
A `ZStack` layers the track and thumb, with the thumb moving based on `isToggled`:

```swift
ZStack {
    RoundedRectangle(cornerRadius: 20)
        .frame(width: 50, height: 30)
        .foregroundStyle(isToggled ? Color.blue : Color.gray)

    Circle()
        .frame(width: 25, height: 25)
        .foregroundStyle(.white)
        .offset(x: isToggled ? 10 : -10)
}
.onTapGesture {
    withAnimation(.linear(duration: 0.25)) {
        isToggled.toggle()
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `CustomToggle` with an interactive `@State` variable:

```swift
#Preview {
    @Previewable @State var isToggled = false
    CustomToggle(isToggled: $isToggled)
}
```

## How to Run
1. Open **CustomToggle.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and interact with the toggle.

## Notes
- The `@Binding` mechanism allows the toggle to be controlled externally.
- `withAnimation` ensures smooth transitions between states.
- `@Previewable` enables real-time interaction in Xcode previews.

---
🚀 *Part of the Daily Swift Tasks learning journey!*