# CustomViewModifiers

## Overview
**CustomViewModifiers** is a SwiftUI project that demonstrates how to create and apply custom view modifiers. This project includes a `DadsStyle` modifier that enhances text styling with a unique appearance.

## Features
- Implements a custom `ViewModifier` named `DadsStyle`.
- Applies the modifier to a `Text` view in `ContentView`.
- Uses an extension on `View` for easier application of the modifier.
- Enhances UI with custom font size, color, padding, and border.

## Code Breakdown

### 🏗️ Defining the Custom View Modifier
The `DadsStyle` struct conforms to `ViewModifier` and applies custom styling:

```swift
struct DadsStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(style: StrokeStyle(lineWidth: 3))
            )
    }
}
```

### 🔄 Creating an Extension for Convenience
This extension allows applying `DadsStyle` with `.dadsStyle()`:

```swift
extension View {
    public func dadsStyle() -> some View {
        modifier(DadsStyle())
    }
}
```

### 🚀 Applying the Custom Modifier in ContentView
The `dadsStyle()` modifier is used to style the `Text` view:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Dad Style!!")
                .dadsStyle()
        }
        .padding()
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of the `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **CustomViewModifiers.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the custom modifier in action.

## Notes
- `ViewModifier` allows reusing styling logic across multiple views.
- The `.dadsStyle()` extension makes applying the modifier more readable.
- The `overlay` property adds a rounded border to the modified view.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
