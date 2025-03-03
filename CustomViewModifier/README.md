# CustomViewModifier

## Overview
**CustomViewModifier** is a SwiftUI project demonstrating how to create and apply custom view modifiers. The project showcases two custom text modifiers that style text differently.

![image](https://github.com/user-attachments/assets/c9578ba7-7000-467a-9e3d-21cbb645390a)

## Features
- Implements two custom `ViewModifier` structs (`BigAndBlueText` and `BigAndRedText`).
- Uses an extension on `View` to simplify applying `BigAndBlueText`.
- Demonstrates how to apply modifiers directly and via a convenience method.
- Utilizes `VStack` and `Spacer` for layout management.

## Code Breakdown

### 🎨 Defining Custom View Modifiers
Two `ViewModifier` structs define reusable text styles:

```swift
struct BigAndBlueText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle) // Makes the text large.
            .foregroundColor(.blue) // Changes the text color to blue.
    }
}

struct BigAndRedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle) // Makes the text large.
            .foregroundColor(.red) // Changes the text color to red.
    }
}
```

### 🏗️ Creating a Convenience Method
An extension on `View` simplifies applying `BigAndBlueText`:

```swift
extension View {
    public func bigAndBlueText() -> some View {
        modifier(BigAndBlueText())
    }
}
```

### 🔄 Applying the Modifiers
Modifiers are applied both directly and via the convenience method:

```swift
VStack {
    Text("This is an example of a custom view called with the convenience method")
        .bigAndBlueText() // Uses the convenience method.

    Text("This is an example of a custom view called without a convenience method")
        .modifier(BigAndRedText()) // Applies the modifier directly.
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
1. Open **CustomViewModifier.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the text modifiers in action.

## Notes
- Using `ViewModifier` improves code reuse and readability.
- The `.bigAndBlueText()` extension simplifies applying the modifier.
- Modifiers can be directly applied using `.modifier(YourModifier())`.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
