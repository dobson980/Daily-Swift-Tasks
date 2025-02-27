# EnvirornmentKeys

## Overview
**EnvirornmentKeys** is a SwiftUI project demonstrating how to create and use custom `EnvironmentKey` values. This approach allows you to share values across multiple views in a structured and reusable way.

<img width="145" alt="image" src="https://github.com/user-attachments/assets/7e601d89-5c05-477c-8ddc-622930559d9c" />

## Features
- Implements a custom `EnvironmentKey` (`DadsKey`) to store and share values.
- Extends `EnvironmentValues` to make accessing the key easy.
- Uses a `View` extension to provide a simple modifier for setting the key.
- Demonstrates setting the environment key at the app level in `@main`.

## Code Breakdown

### 🛠️ Creating the Custom Environment Key
The `DadsKey` struct conforms to `EnvironmentKey`, defining a default value:

```swift
struct DadsKey: EnvironmentKey {
    static let defaultValue: String = "dad123"
}
```

### 🔄 Extending EnvironmentValues
This extension makes `DadsKey` accessible via `.dadsKey`:

```swift
extension EnvironmentValues {
    var dadsKey: String {
        get { self[DadsKey.self] }
        set { self[DadsKey.self] = newValue }
    }
}
```

### 🏗️ Creating a View Modifier for Convenience
This extension allows setting the key using `.dadsKey("newValue")`:

```swift
extension View {
    public func dadsKey(_ dadsKey: String) -> some View {
        environment(\.dadsKey, dadsKey)
    }
}
```

### 🚀 Using the Custom Environment Key in the App
The `@main` struct applies the `dadsKey` modifier at the top level:

```swift
@main
struct EnvirornmentKeysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .dadsKey("dad1234")
        }
    }
}
```

## How to Run
1. Open **EnvirornmentKeys.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see how environment keys work.

## Notes
- `EnvironmentKey` is useful for globally sharing values without passing them explicitly.
- Custom environment keys allow flexibility in building scalable SwiftUI apps.
- Future enhancements could include adding dynamic updates based on user interaction.

---

🚀 *Part of the Daily Swift Tasks learning journey!*
