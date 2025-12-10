# withAnimation_vs_animation

## Overview
**withAnimation_vs_animation** is a SwiftUI project that compares two common ways to animate view changes: attaching the `.animation(_:, value:)` modifier directly to views, and wrapping state changes inside `withAnimation(_:_:)`. The app uses simple rectangles and a shared toggle to highlight how each approach affects animation behavior.

![withAnimation_vs_animation](https://github.com/user-attachments/assets/placeholder-withAnimation-vs-animation)

## Features
- Demonstrates the difference between `.animation(_:, value:)` and `withAnimation(_:_:)`.
- Uses a `TabView` with two tabs: **Animated** and **withAnimation**.
- Animates rectangle width changes when a button toggles a `@State` value.
- Shows how implicit animations attach to individual views vs. explicit animations around state changes.

## Code Breakdown

### 🧩 ContentView and Tab Setup
`ContentView` hosts a `TabView` that switches between the two animation techniques:

```swift
struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Animated", systemImage: "sparkles") {
                AnimatedView()
            }
            Tab("withAnimation", systemImage: "wand.and.stars") {
                WithAnimation()
            }
        }
    }
}
```

### 🔁 Using the `.animation` Modifier
`AnimatedView` applies the `.animation` modifier directly to each rectangle so changes to `smallViews` are implicitly animated:

```swift
struct AnimatedView: View {
    @State private var smallViews: Bool = true

    var body: some View {
        VStack {
            Spacer()

            Rectangle()
                .fill(.red)
                .frame(width: smallViews ? 200 : 100, height: 100)
                .animation(.easeInOut, value: smallViews)

            Rectangle()
                .fill(.blue)
                .frame(width: smallViews ? 200 : 100 , height: 100)
                .animation(.easeInOut, value: smallViews)

            Spacer()

            Button("Animate") {
                smallViews.toggle()
            }
            .buttonStyle(.glassProminent)
            .tint(.orange)
        }
        .padding()
    }
}
```

### 🎬 Using `withAnimation` for Explicit Control
`WithAnimation` wraps the state change inside `withAnimation`, so any dependent views animate together with the specified timing:

```swift
struct WithAnimation: View {
    @State private var smallViews: Bool = true

    var body: some View {
        VStack {
            Spacer()

            Rectangle()
                .fill(.cyan)
                .frame(width: smallViews ? 200 : 100, height: 100)

            Rectangle()
                .fill(.orange)
                .frame(width: smallViews ? 200 : 100, height: 100)

            Spacer()

            Button("Animate") {
                withAnimation(.easeInOut(duration: 1)) {
                    smallViews.toggle()
                }
            }
            .buttonStyle(.glassProminent)
            .tint(.indigo)
        }
        .padding()
    }
}
```

## How to Run
1. Open **withAnimation_vs_animation.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`).
4. Switch between the **Animated** and **withAnimation** tabs and tap **Animate** in each to observe how the rectangles resize and animate.

## Notes
- `.animation(_:, value:)` attaches an implicit animation to the view, tied to changes in the specified value.
- `withAnimation(_:_:)` animates all layout changes that occur inside its closure with the same animation.
- This demo focuses on width changes, but the same concepts apply to other animatable properties like position, opacity, and scale.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
