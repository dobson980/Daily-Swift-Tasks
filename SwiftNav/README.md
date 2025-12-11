# SwiftNav

## Overview

**SwiftNav** is a SwiftUI demo that explores modern navigation using `NavigationStack`, a shared observable navigation manager, and type-safe destinations. It focuses on driving navigation from a central object instead of pushing views directly.

## Screenshot

<!-- Replace this with a real screenshot URL when available. -->
![SwiftNav](https://github.com/user-attachments/assets/placeholder-swiftnav)

## Features

- Uses `NavigationStack` with a typed `NavigationPath` for pushing destinations.
- Central `NavigationManager` marked `@Observable` to coordinate navigation state.
- Simple `NavigationPage` enum to keep destinations type-safe and easy to reason about.
- Reusable `ColoredPage` view that configures background and button appearance.
- Glass-styled buttons via `ColoredGlassButton` and `GlassButtonStyle` for a modern look.
- Full-screen `ColoredBackground` helper that cleanly fills the entire screen.

## Code Breakdown

### 🧭 NavigationManager and NavigationPath

`NavigationManager` owns the navigation state and exposes simple methods for pushing pages:

```swift
@Observable
class NavigationManager {
    static let shared = NavigationManager()
    private init() {}

    var path = NavigationPath()

    func goToOrangePage() {
        path.append(NavigationPage.orangePage)
    }

    func goToRedPage() {
        path.append(NavigationPage.redPage)
    }

    func popToRoot() {
        path = NavigationPath()
    }
}
```

The `@Observable` macro makes changes to `path` automatically visible to any `NavigationStack` that binds to it.

### 📄 Type-safe destinations with NavigationPage

Destinations are represented as an enum, keeping navigation intent clear and easy to switch over:

```swift
enum NavigationPage: Hashable {
    case orangePage, redPage
}
```

`ContentView` uses `.navigationDestination(for:)` to map each case to a concrete view.

### 🏠 ContentView and NavigationStack

The home screen binds a `NavigationStack` to the manager's `path` and provides buttons to push new pages:

```swift
struct ContentView: View {
    @State var nav = NavigationManager.shared

    var body: some View {
        NavigationStack(path: $nav.path) {
            VStack(spacing: 20) {
                ColoredGlassButton(title: "Red", color: .red) {
                    nav.goToRedPage()
                }

                ColoredGlassButton(title: "Orange", color: .orange) {
                    nav.goToOrangePage()
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: NavigationPage.self) { page in
                switch page {
                case .orangePage:
                    ColoredPage(backgroundColor: .orange,
                                buttonText: "Orange",
                                buttonColor: .orange) {
                        nav.popToRoot()
                    }
                case .redPage:
                    ColoredPage(backgroundColor: .red,
                                buttonText: "Red",
                                buttonColor: .red) {
                        nav.popToRoot()
                    }
                }
            }
        }
    }
}
```

This pattern keeps navigation logic separated from the view layout and makes it easy to add new destinations.

### 🎨 ColoredPage and glass buttons

`ColoredPage` composes a full-screen background with a central glass-styled button:

```swift
struct ColoredPage: View {
    var backgroundColor: Color
    var buttonText: String
    var buttonColor: Color
    var action: () -> Void

    var body: some View {
        ZStack {
            ColoredBackground(color: backgroundColor)
            ColoredGlassButton(title: buttonText,
                               color: buttonColor,
                               glassStyle: .glass) {
                action()
            }
        }
    }
}
```

`ColoredGlassButton` wraps SwiftUI's glass button styles and exposes them through a simple enum:

```swift
struct ColoredGlassButton: View {
    var title: String
    var color: Color
    var glassStyle: GlassButtonStyle
    var action: () -> Void

    var body: some View {
        Button(title) {
            action()
        }
        .applyGlassStyle(glassStyle)
        .tint(color)
        .controlSize(.large)
    }
}
```

## How to Run

1. Open **SwiftNav.xcodeproj** in Xcode.
2. Select an iOS simulator or a connected device.
3. Run the app with **Cmd + R**.
4. On the home screen, tap **Red** or **Orange** to push a colored page onto the navigation stack.
5. On the destination page, tap the central button to pop back to the root.

## Notes

- This demo uses `NavigationStack` and `NavigationPath`, introduced in newer versions of SwiftUI.
- `NavigationManager.shared` is a convenient singleton for the demo; in production apps you might inject a navigation controller instead.
- Adding new pages usually means:
  - Extending the `NavigationPage` enum with a new case.
  - Adding a method on `NavigationManager` to push that case.
  - Updating `.navigationDestination(for:)` in `ContentView` to render the new destination.

## Technologies Used

- Swift
- SwiftUI
- `NavigationStack` / `NavigationPath`
- `@Observable` macro for state sharing
- Glass button styles (`.glass`, `.glassProminent`)

---
🚀 *Part of the Daily Swift Tasks learning journey!*