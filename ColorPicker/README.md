# ColorPicker

## Overview
**ColorPicker** is a SwiftUI project that demonstrates how to use a `ColorPicker` to dynamically change the color of text. This project shows how to bind a selected color to a `@State` property and apply it to a text view in real-time.

## Features
- Uses `@State` to track the selected color.
- Updates the text’s foreground color dynamically as the user picks a color.
- Implements a `ColorPicker` with a hidden label for a cleaner UI.
- Uses `VStack` for structured layout and padding for better spacing.

## Code Breakdown

### 🎨 Managing the Selected Color
A `@State` variable stores the currently picked color:

```swift
@State private var pickedColor: Color = .black
```

### 🖌️ Dynamically Changing the Text Color
The text color updates automatically based on the selected color:

```swift
Text("Change my color")
    .font(.system(size: 40))
    .font(.largeTitle)
    .foregroundStyle(pickedColor) // Updates color dynamically
```

### 🎛️ Implementing the ColorPicker
The `ColorPicker` lets users choose a color, binding its value to `pickedColor`:

```swift
ColorPicker("", selection: $pickedColor)
    .labelsHidden() // Hides the default label for a cleaner UI.
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **ColorPicker.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and use the `ColorPicker` to change the text color.

## Notes
- `ColorPicker` is a built-in SwiftUI component that provides a color selection UI.
- Using `.labelsHidden()` improves the UI by removing unnecessary labels.
- This project demonstrates SwiftUI’s reactive UI updates by binding state changes to views.

---
🚀 *Part of the Daily Swift Tasks learning journey!*