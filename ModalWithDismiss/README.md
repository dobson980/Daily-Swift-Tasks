# ModalWithDismiss

## Overview
**ModalWithDismiss** is a SwiftUI project demonstrating how to present and dismiss a modal using `.sheet` and `@Environment(\.dismiss)`. The project displays an informational modal about SwiftUI, which the user can dismiss via a button.

![ModalWithDismiss](https://github.com/user-attachments/assets/ab933d60-288d-445a-b2f1-11a5e7326e97)

## Features
- Uses `@State` to track modal presentation.
- Implements `.sheet` to present the modal view.
- Uses `@Environment(\.dismiss)` to close the modal.
- Applies `.presentationDetents([.medium])` for a medium-sized modal.

## Code Breakdown

### 🔄 Managing Modal Presentation
The `@State` property controls when the modal is shown:

```swift
@State private var isPresented = false
```

A button toggles the modal presentation state:

```swift
Button {
    isPresented.toggle()
} label: {
    Text("Learn More")
}
.buttonStyle(.borderedProminent)
```

### 📌 Implementing the Modal View
The `ModalView` contains informational text and a dismiss button:

```swift
struct ModalView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text(
                """
                SwiftUI is a framework developed by Apple that allows developers to build user interfaces...
                """
            )
            .font(.system(size: 20))
            .padding()

            Button("Dismiss") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding()
        .presentationDetents([.medium])
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView` and `ModalView`:

```swift
#Preview {
    ContentView()
}

#Preview {
    ModalView()
}
```

## How to Run
1. Open **ModalWithDismiss.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap "Learn More" to present the modal.

## Notes
- `@Environment(\.dismiss)` is the recommended way to close modals in SwiftUI.
- The `.presentationDetents([.medium])` keeps the modal at a medium height.
- `.sheet(isPresented: $isPresented) { ModalView() }` efficiently manages modal presentation.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
