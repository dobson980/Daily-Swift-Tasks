# CustomPicker
A lockable, two-column time picker with a slick edit toggle and animated focus.

## Overview
**CustomPicker** demonstrates how to build a dual-column time selector that stays read-only until explicitly unlocked. It highlights coordinated animations between scrolling columns, rounded container shapes, and an inline toggle that flips from a pencil to a checkmark.

## Screenshot
![CustomPicker](https://github.com/user-attachments/assets/0e8b7a95-522e-4f3d-8123-76c8c3311e1c)

## Features
- Lockable edit mode that disables scrolling until the toggle is tapped, then animates spacing and corner radii open.
- Scroll-aligned columns powered by `ScrollViewReader` and `scrollPosition` to keep the selected value centered.
- Focused typography and fading rows: the active value stays bright while inactive rows fade when locked and animate back when unlocked.
- Trailing toggle that swaps between pencil and checkmark using `.blurReplace` plus directional offsets for motion.
- Custom `UnevenRoundedRectangle` shaping so the three segments read as one capsule when locked and fully rounded when editing.

## Code Breakdown
### 🔐 Driving edit state
```swift
@State private var isEditing = false
@State private var hour = "20"
@State private var minute = "30"

TimePickerRow(
    isEditing: $isEditing,
    selectedHour: $hour,
    selectedMinute: $minute,
    hours: hours,
    minutes: minutes
)
```
`isEditing` gates interactivity: spacing opens, pickers accept hits, and the toggle icon flips once this state turns true.

### 🌀 Picker column focus
```swift
ForEach(values, id: \.self) { value in
    Text(value)
        .foregroundStyle(selectedValue == value ? .primary : .gray)
        .opacity(selectedValue == value ? 1 : (isEditing ? 1 : 0.01))
        .scrollTransition(axis: .vertical) { effect, phase in
            effect.scaleEffect(phase.isIdentity ? 1.0 : 0.1)
        }
}
.scrollPosition(id: $scrollID, anchor: .center)
.allowsHitTesting(isEditing)
```
Rows shrink as they move off-center, stay opaque while editing, and fade when locked; `scrollPosition` keeps the chosen value centered and writes back through `scrollID`.

### ✏️ Toggle animation
```swift
ZStack {
    if isEditing {
        Image(systemName: "checkmark")
            .transition(.blurReplace.combined(with: .offset(x: -35)))
    } else {
        Image(.pen)
            .transition(.blurReplace.combined(with: .offset(x: 35)))
    }
}
.onTapGesture {
    withAnimation(!isEditing ? .smooth(duration: 0.5, extraBounce: 0.5) : .smooth) {
        isEditing.toggle()
    }
}
```
Tapping swaps the icons with opposing slide directions; the animation also grows the control’s height and rounds its leading corners to match the expanded pickers.

## How to Run
1. Open **CustomPicker.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run (Cmd + R). Tap the pencil to unlock, scroll hours/minutes, then tap the checkmark to lock the selection.

## Notes
- Color `BG.tertiary` and the `pen` asset are defined in the asset catalog; keep them if duplicating the component.
- Hour range is `0...24` and minute range is `0...60` in this demo; adjust the arrays to fit your product rules.
- Scroll focus relies on `scrollTargetLayout` and `scrollPosition`, which require iOS 17+.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
