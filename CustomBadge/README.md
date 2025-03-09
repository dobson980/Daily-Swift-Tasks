# CustomBadge

## Overview
**CustomBadge** is a SwiftUI project demonstrating how to create a reusable custom badge view. The project features a `BadgeView` that dynamically displays a badge count and integrates it into a text label.

## Features
- Implements a reusable `BadgeView` that displays a numeric badge count.
- Uses a `RoundedRectangle` with a text overlay to represent the badge.
- Integrates the badge within a `HStack` for a clean UI layout.
- Supports easy customization of the badge count via a parameter.

## Code Breakdown

### 🏷️ Creating the BadgeView
The `BadgeView` uses a `ZStack` to overlay text on a styled rectangle:

```swift
struct BadgeView: View {
    var badgeCount: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 4)
                .fill(.blue)
                .frame(width: 25, height: 25)
                .foregroundColor(.blue)
            Text("\(badgeCount)")
                .foregroundStyle(.white)
        }
    }
}
```

### 🏗️ Integrating the Badge in ContentView
The `BadgeView` is placed next to a text label inside an `HStack`:

```swift
HStack {
    Text("Here is a custom badge")
        .font(.system(size: 30, weight: .bold))
    BadgeView(badgeCount: 8)
        .offset(x: -15, y: -20) // Adjusts the badge position.
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `BadgeView` and `ContentView`:

```swift
#Preview {
    BadgeView(badgeCount: 4)
}

#Preview {
    ContentView()
}
```

## How to Run
1. Open **CustomBadge.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the custom badge in action.

## Notes
- `BadgeView` can be reused across different parts of an app.
- The `offset` modifier positions the badge relative to other UI elements.
- The `RoundedRectangle` styling makes the badge visually distinct.

---
🚀 *Part of the Daily Swift Tasks learning journey!*