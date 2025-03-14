# RadialMenu

## Overview
**RadialMenu** is a SwiftUI project demonstrating how to create an expandable radial menu with animated icons positioned around a central toggle button. The menu expands when tapped, revealing additional options, and collapses when tapped again.

![Radial Menu](https://github.com/user-attachments/assets/0b275d05-c5f3-4c11-9567-a470a116aa08)

## Features
- Uses `@Binding` to control the expanded/collapsed state of the menu.
- Animates menu icons using `withAnimation(.linear(duration: 0.5))`.
- Positions icons radially using `offset(x:y:)` and opacity modifiers.
- Utilizes `symbolRenderingMode(.multicolor)` for vibrant UI effects.

## Code Breakdown

### 🔄 Managing the Menu State
A `@Binding` property allows external control over menu expansion:

```swift
@Binding var expanded: Bool
```

A computed property dynamically adjusts icon size:

```swift
private var expandedIconSize: Double {
    expanded ? 50 : 1
}
```

### 🏗️ Structuring the RadialMenu
A `ZStack` layers the icons and toggle button:

```swift
ZStack {
    Group {
        Image(systemName: "phone")
            .font(.system(size: expandedIconSize))
            .foregroundStyle(.blue)
            .offset(x: expanded ? -100 : 0, y: expanded ? -30 : 0)
            .opacity(expanded ? 1 : 0)

        Image(systemName: "message")
            .font(.system(size: expandedIconSize))
            .foregroundStyle(.green)
            .offset(x: 0, y: expanded ? -100 : 0)
            .opacity(expanded ? 1 : 0)

        Image(systemName: "envelope.fill")
            .font(.system(size: expandedIconSize))
            .foregroundStyle(.red)
            .offset(x: expanded ? 100 : 0, y: expanded ? -30 : 0)
            .opacity(expanded ? 1 : 0)
    }
}
```

### 🎬 Adding Animation to the Toggle Button
Tapping the central button toggles the menu state with animation:

```swift
Button {
    withAnimation(.linear(duration: 0.5)) {
        expanded.toggle()
    }
} label: {
    Image(systemName: "circle.circle.fill")
        .font(.system(size: 75))
}
.foregroundStyle(.cyan)
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `RadialMenu`:

```swift
#Preview {
    @Previewable @State var expanded = false
    RadialMenu(expanded: $expanded)
}
```

## How to Run
1. Open **RadialMenu.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap the central button to expand/collapse the menu.

## Notes
- `@Binding` allows parent views to control the menu state externally.
- `.offset(x:y:)` positions icons in a radial pattern.
- `withAnimation` ensures smooth transitions between menu states.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
