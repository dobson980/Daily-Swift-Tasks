# CustomSlider

## Overview
**CustomSlider** is a SwiftUI project demonstrating how to create a custom half-circle progress view paired with a slider to control progress. The project visualizes progress using a `HalfCircleProgressView` and allows users to interactively adjust the value.

## Features
- Implements a `HalfCircleProgressView` to display progress in a half-circle format.
- Uses a `Slider` to dynamically adjust the progress value.
- Applies a `LinearGradient` to enhance the visual appeal of the progress indicator.
- Normalizes progress between a defined `minValue` and `maxValue` range.

## Code Breakdown

### 🎛️ Managing Progress State
The `@State` property tracks the progress value, which updates dynamically:

```swift
@State private var progress: Double = 0.0
```

### 🏗️ Structuring the ContentView
The `VStack` arranges the progress view and slider:

```swift
VStack {
    HalfCircleProgressView(progress: progress, totalSteps: 1000, minValue: 0, maxValue: 1)
    Slider(value: $progress)
}
.padding()
```

### 📏 Creating the Half-Circle Progress View
The `HalfCircleProgressView` normalizes the progress and applies a gradient stroke:

```swift
struct HalfCircleProgressView: View {
    var progress: CGFloat
    var totalSteps: Int
    var minValue: CGFloat
    var maxValue: CGFloat

    private var normalizedProgress: CGFloat {
        (progress - minValue) / (maxValue - minValue)
    }

    var body: some View {
        ZStack {
            HalfCircleShape()
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.gray.opacity(0.3))
                .frame(width: 200, height: 100)

            HalfCircleShape().trim(from: 0.0, to: normalizedProgress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .indigo]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 200, height: 100)
        }
    }
}
```

### 🔵 Defining the Half-Circle Shape
A `Shape` struct is used to create a half-circle path:

```swift
struct HalfCircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        return path
    }
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
1. Open **CustomSlider.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to interact with the slider and see the progress update.

## Notes
- `HalfCircleProgressView` provides a unique visual representation of progress.
- Using `.trim(from: 0.0, to: normalizedProgress)` creates a smooth progress effect.
- The gradient stroke enhances the visual clarity of the progress indicator.

---
🚀 *Part of the Daily Swift Tasks learning journey!*