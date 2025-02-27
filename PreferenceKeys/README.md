# PreferenceKeys

## Overview
**PreferenceKeys** is a SwiftUI project that demonstrates how to use `PreferenceKey` to pass data **up** the view hierarchy. This approach allows child views to update values that parent views can observe and respond to.

## Features
- Implements a custom `PreferenceKey` for passing data up the view hierarchy.
- Uses a SwiftUI `TextField` inside a child view to update the parent's state.
- Demonstrates a simple `View` extension for cleaner preference key updates.
- Uses `onPreferenceChange` to react to updates in the parent view.

## Code Breakdown

### 🛠️ Defining the Preference Key
The preference key is implemented as a struct conforming to `PreferenceKey`:

```swift
struct DadsPreferenceKey: PreferenceKey {
    static var defaultValue: String = "Default Value"

    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
```

### 🔄 Updating Preferences in a Child View
The `ChildView` updates the preference key whenever text input changes:

```swift
TextField("Enter Some Text", text: $childText)
    .updateDadsPreferenceKey(with: childText)
    .textFieldStyle(.roundedBorder)
```

### 📡 Listening for Changes in the Parent View
The parent view (`ContentView`) listens for changes using `onPreferenceChange`:

```swift
.onPreferenceChange(DadsPreferenceKey.self) { newValue in
    childAppValue = newValue
}
```

### ✨ View Extension for Cleaner Code
An extension on `View` makes it easy to update the preference key:

```swift
extension View {
    func updateDadsPreferenceKey(with value: String) -> some View {
        self.preference(key: DadsPreferenceKey.self, value: value)
    }
}
```

## How to Run
1. Open **PreferenceKeys.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and type into the `TextField` to see the parent view update dynamically.

## Notes
- `PreferenceKey` is useful for scenarios where children need to send data to parents.
- Unlike `@Binding`, it allows **loose coupling** between parent and child views.
- Future improvements could include multiple child views updating different preference keys.

---

🚀 *Part of the Daily Swift Tasks learning journey!*
