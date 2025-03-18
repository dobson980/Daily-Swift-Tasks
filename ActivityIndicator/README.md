# ActivityIndicator

## Overview
**ActivityIndicator** is a SwiftUI project demonstrating how to create and animate a loading indicator using SF Symbols and rotation effects. The project includes a toggle button to start and stop the loading animation.

![ActivityIndicator](https://github.com/user-attachments/assets/c05f8de8-e0ff-4ab7-8f40-9fa3bccb60d2)

## Features
- Uses an SF Symbol to represent a loading spinner.
- Implements `@Binding` to control animation state externally.
- Uses `rotationEffect` and `withAnimation` for continuous spinning.
- Includes a button to toggle the loading state.

## Code Breakdown

### 🔄 Managing Loading State
A `@State` property tracks whether the activity indicator should animate:

```swift
@State private var isLoading = false
@State private var rotationAngle: Double = 0
```

### 🏗️ Structuring the ContentView
A `VStack` arranges the spinner and toggle button:

```swift
VStack {
    Spacer()

    ActivityIndicator(isAnimating: $isLoading)
        .rotationEffect(.degrees(rotationAngle))
        .onChange(of: isLoading) { oldValue, newValue in
            if newValue {
                withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    rotationAngle = 360
                }
            } else {
                rotationAngle = 0
            }
        }

    Spacer()

    Button {
        isLoading.toggle()
    } label: {
        Text("Load Data")
    }
    .buttonStyle(.borderedProminent)
}
.padding()
```

### 🔄 Implementing the Activity Indicator
A simple SF Symbol is used as the spinner:

```swift
struct ActivityIndicator: View {
    @Binding var isAnimating: Bool

    var body: some View {
        Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90.circle")
            .font(.system(size: 100))
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ActivityIndicator`:

```swift
#Preview {
    @Previewable @State var animate: Bool = true
    ActivityIndicator(isAnimating: $animate)
}
```

## How to Run
1. Open **ActivityIndicator.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap "Load Data" to toggle the loading animation.

## Notes
- The animation repeats indefinitely when `isLoading` is true.
- `rotationEffect` applies a 360-degree rotation for a smooth spinning effect.
- The button toggles the animation state and visually updates based on `isLoading`.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
