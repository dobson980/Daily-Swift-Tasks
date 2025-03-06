# BindableComponent

## Overview
**BindableComponent** is a SwiftUI project demonstrating how to use `@Binding` to create a reusable toggle component. The project features a toggle switch that updates an image dynamically based on state changes.

## Features
- Uses `@State` to manage the `raining` variable in `ContentView`.
- Implements a `CustomToggle` component that binds to `@Binding`.
- Dynamically changes an SF Symbol (`cloud.rain` or `sun.max`) based on state.
- Applies smooth animations for a seamless UI experience.

## Code Breakdown

### 🔄 Managing State in ContentView
The `@State` property keeps track of whether it's raining:

```swift
@State private var raining = false
```

The image updates dynamically based on the `raining` state:

```swift
Image(systemName: raining ? "cloud.rain" : "sun.max")
    .font(.system(size: 100))
    .frame(width: 100, height: 100)
    .symbolRenderingMode(.palette)
    .foregroundStyle(
        raining ? .gray : .yellow, // Outer color
        raining ? .blue : .yellow  // Inner color
    )
    .animation(.easeInOut, value: raining)
```

### 🎛️ Creating a Reusable Toggle Component
The `CustomToggle` component binds to an external Boolean state:

```swift
struct CustomToggle: View {
    @Binding var toggleState: Bool

    var body: some View {
        HStack {
            Text("Make it Rain")
            Toggle("", isOn: $toggleState)
                .toggleStyle(.switch)
                .labelsHidden()
        }
        .padding()
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView` and `CustomToggle`:

```swift
#Preview {
    ContentView()
}

#Preview {
    @Previewable @State var previewToggleState = false
    return CustomToggle(toggleState: $previewToggleState)
}
```

## How to Run
1. Open **BindableComponent.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to test the interactive toggle.

## Notes
- `@Binding` allows `CustomToggle` to modify the `raining` state in `ContentView`.
- The image transition is animated smoothly using `.easeInOut`.
- `symbolRenderingMode(.palette)` enables multi-color SF Symbols.

---
🚀 *Part of the Daily Swift Tasks learning journey!*