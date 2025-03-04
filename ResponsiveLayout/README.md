# ResponsiveLayout

## Overview
**ResponsiveLayout** is a SwiftUI project demonstrating how to create adaptive layouts using `GeometryReader`. The project ensures UI elements scale proportionally based on available screen space, making it ideal for building responsive designs.

## Features
- Uses `GeometryReader` to obtain dynamic layout dimensions.
- Adjusts shape sizes relative to the smallest screen dimension.
- Implements a `Rectangle` and `Circle` that adapt responsively.
- Centers content dynamically with `frame(maxWidth: .infinity, maxHeight: .infinity)`.

## Code Breakdown

### 📏 Using GeometryReader for Responsiveness
The `GeometryReader` provides real-time access to the view’s size, enabling adaptive layouts:

```swift
GeometryReader { geometry in
    let minDimension = min(geometry.size.width, geometry.size.height)
```

### 🎨 Creating Responsive Shapes
The shapes dynamically size themselves relative to the smallest dimension:

```swift
Rectangle()
    .frame(width: minDimension / 3, height: minDimension / 3)
    .foregroundStyle(.red) // Red rectangle.

Circle()
    .frame(width: minDimension / 2)
    .foregroundStyle(.blue) // Blue circle.
```

### 🔄 Structuring the Layout
Shapes are arranged using `HStack` and `VStack` to ensure a balanced layout:

```swift
HStack {
    VStack {
        Rectangle()
        Circle()
    }
}
.frame(maxWidth: .infinity, maxHeight: .infinity) // Centers content.
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **ResponsiveLayout.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the responsive layout in action.

## Notes
- `GeometryReader` makes it easy to create adaptive UIs for different screen sizes.
- The shapes scale based on the smaller screen dimension to maintain proportions.
- Using `.frame(maxWidth: .infinity, maxHeight: .infinity)` keeps the layout centered.

---
🚀 *Part of the Daily Swift Tasks learning journey!*