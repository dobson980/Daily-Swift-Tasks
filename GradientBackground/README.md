# GradientBackground

## Overview
**GradientBackground** is a SwiftUI project demonstrating how to use different types of gradients as backgrounds within a `TabView`. It includes both `LinearGradient` and `RadialGradient`, showcasing how to apply them using a reusable `GradientView`.

![GradientBG](https://github.com/user-attachments/assets/0c97c41e-3df1-4ece-9c0e-2e4cf2550a68)

## Features
- Implements a `TabView` to switch between gradient types.
- Uses `LinearGradient` and `RadialGradient` to create visually appealing backgrounds.
- Utilizes a generic `GradientView` to handle different gradient types dynamically.
- Customizes the tab bar appearance with a dark theme.

## Code Breakdown

### 🎨 Implementing the TabView with Gradients
The `ContentView` includes a `TabView` with two tabs, each showcasing a different gradient:

```swift
TabView {
    // The first tab shows a Linear Gradient.
    Tab("Linear", systemImage: "line.diagonal.arrow") {
        GradientView(
            gradient: LinearGradient(
                gradient: Gradient(colors: [.blue, .green, .orange]),
                startPoint: .bottom,
                endPoint: .top),
            gradientType: "Linear")
    }

    // The second tab shows a Radial Gradient.
    Tab("Radial", systemImage: "circle.dashed") {
        GradientView(
            gradient: RadialGradient(
                colors: [.blue, .green, .orange],
                center: .center,
                startRadius: 400,
                endRadius: 20),
            gradientType: "Radial")
    }
}
.accentColor(.white) // Sets the accent color for the tab icons.
.onAppear {
    UITabBar.appearance().barStyle = .black // Ensures the tab bar background is black.
}
```

### 🏗️ Creating a Reusable GradientView
A generic `GradientView` handles different gradient types dynamically:

```swift
struct GradientView<Gradient: View>: View {
    let gradient: Gradient // Accepts any gradient view (e.g., LinearGradient, RadialGradient).
    let gradientType: String // A label describing the gradient type.

    var body: some View {
        ZStack {
            gradient
                .ignoresSafeArea() // Ensures the gradient covers the full screen.
            VStack {
                Text("\(gradientType) Gradient")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
            .padding()
        }
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
1. Open **GradientBackground.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to explore gradient effects.

## Notes
- The generic `GradientView` makes it easy to add new gradient types in the future.
- The `.accentColor(.white)` ensures the tab icons remain visible.
- `UITabBar.appearance().barStyle = .black` creates a sleek dark mode effect.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
