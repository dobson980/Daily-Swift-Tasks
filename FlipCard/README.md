# FlipCard

## Overview
**FlipCard** is a SwiftUI project demonstrating how to create an interactive flipping card using `@Binding` and `rotation3DEffect`. The card smoothly transitions between a front and back side when tapped.

![FlipCard](https://github.com/user-attachments/assets/3f4ce980-9a4b-42ed-a02e-5605fde0e364)

## Features
- Uses `@Binding` to control the flip state.
- Implements `ZStack` to overlay the front and back views.
- Applies `rotation3DEffect` for a smooth 3D flip animation.
- Uses `withAnimation(.easeInOut(duration: 0.5))` for natural transitions.

## Code Breakdown

### 🔄 Managing Flip State
A `@Binding` property tracks whether the card is flipped:

```swift
@Binding var isFlipped: Bool
```

### 🏗️ Structuring the FlipCard View
A `ZStack` overlays the front and back views:

```swift
ZStack {
    // Front View
    ZStack {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(width: 250, height: 400)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 4))
        Text("Front")
            .font(.system(size: 50, weight: .bold))
            .foregroundStyle(Gradient(colors: [.blue, .green]))
    }
    .opacity(isFlipped ? 0 : 1)
    .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))

    // Back View
    ZStack {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(.systemGray6))
            .frame(width: 250, height: 400)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 4))
        Text("Back")
            .font(.system(size: 50, weight: .bold))
            .foregroundStyle(Gradient(colors: [.orange, .red]))
    }
    .opacity(isFlipped ? 1 : 0)
    .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
}
```

### 🎬 Adding Tap Gesture for Flipping
Tapping the card toggles its flip state:

```swift
.onTapGesture {
    withAnimation(.easeInOut(duration: 0.5)) {
        isFlipped.toggle()
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `FlipCard`:

```swift
#Preview {
    @Previewable @State var flipped = false
    FlipCard(isFlipped: $flipped)
}
```

## How to Run
1. Open **FlipCard.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap the card to flip it.

## Notes
- `rotation3DEffect` simulates a realistic 3D flip effect.
- The front and back views are layered using `ZStack`.
- `@Binding` allows external control over the card’s flip state.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
