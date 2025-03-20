# SkeletonLoader

## Overview
**SkeletonLoader** is a SwiftUI project demonstrating how to create a shimmering skeleton loader effect using `LinearGradient` and `GeometryReader`. The project includes a placeholder animation that mimics loading states in apps.

## Features
- Implements a shimmering effect using a moving gradient overlay.
- Uses `GeometryReader` to dynamically adjust the gradient width.
- Animates the loader continuously for a realistic loading experience.
- Displays a humorous placeholder text below the loader.

## Code Breakdown

### 🔄 Managing Animation State
A `@State` property in `LoaderView` tracks the gradient's movement:

```swift
@State private var gradientOffset: CGFloat = 0
```

### 🏗️ Structuring the ContentView
A `VStack` arranges the loader and text:

```swift
VStack {
    LoaderView()
    
    Text("It might load eventually...")
        .font(.system(size: 30))
}
```

### ✨ Implementing the Shimmer Effect
A `LinearGradient` is animated across a rounded rectangle:

```swift
RoundedRectangle(cornerRadius: 10)
    .fill(Color.gray.opacity(0.3))
    .overlay {
        GeometryReader { geometry in
            let width = geometry.size.width
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.clear, location: 0.0),
                            .init(color: Color.white.opacity(0.6), location: 0.5),
                            .init(color: Color.clear, location: 1.0)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: width)
                .offset(x: gradientOffset)
                .mask(RoundedRectangle(cornerRadius: 10))
                .onAppear {
                    gradientOffset = -width
                    withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        gradientOffset = width
                    }
                }
        }
    }
    .padding()
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView` and `LoaderView`:

```swift
#Preview {
    ContentView()
}

#Preview {
    LoaderView()
}
```

## How to Run
1. Open **SkeletonLoader.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the shimmering loading effect.

## Notes
- `GeometryReader` ensures the gradient adapts to different screen sizes.
- The animation loops indefinitely using `.repeatForever(autoreverses: false)`.
- The text humorously suggests an unpredictable loading time.

---
🚀 *Part of the Daily Swift Tasks learning journey!*