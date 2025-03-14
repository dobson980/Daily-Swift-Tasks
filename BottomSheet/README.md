# BottomSheet

## Overview
**BottomSheet** is a SwiftUI project demonstrating how to create a reusable bottom sheet that slides up from the bottom of the screen. The sheet can be dismissed by dragging it downward or toggling its visibility via a button.

![BottomSheet](https://github.com/user-attachments/assets/c0f5a560-952e-420c-aa0f-35259e24b8e4)

## Features
- Uses `@State` to control bottom sheet visibility.
- Implements `ZStack` to layer the bottom sheet behind the main content.
- Supports drag gestures for interactive dismissal.
- Applies smooth animations for opening and closing transitions.

## Code Breakdown

### 🔄 Managing Bottom Sheet Visibility
A `@State` property in `ContentView` tracks whether the sheet is shown:

```swift
@State private var showInfoPane: Bool = false
```

### 🏗️ Structuring the ContentView
A `ZStack` places the button and bottom sheet:

```swift
ZStack {
    VStack {
        Button {
            withAnimation(.easeInOut(duration: 0.5)) {
                showInfoPane.toggle()
            }
        } label: {
            VStack {
                Image(systemName: "info.circle")
                    .font(.system(size: 40))
                Text("Show More Info")
            }
        }
    }
    .padding()

    BottomSheet(isPresented: $showInfoPane)
}
```

### 📌 Implementing the Bottom Sheet
A `RoundedRectangle` provides the background, with a `VStack` for content:

```swift
RoundedRectangle(cornerRadius: 10)
    .fill(Color(.systemGray6))
    .frame(width: 300, height: 300)
    .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.black, lineWidth: 1)
    )
```

### 🎭 Handling Drag Gestures
The sheet can be dismissed by dragging it down:

```swift
.gesture(
    DragGesture()
        .onChanged { value in
            dragOffset = value.translation.height
        }
        .onEnded { value in
            if value.translation.height > 100 {
                withAnimation(.easeInOut(duration: 0.5)) {
                    dragOffset = 800
                }
                Task {
                    try? await Task.sleep(nanoseconds: 500_000_000)
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isPresented = false
                        dragOffset = 0
                    }
                }
            } else {
                withAnimation(.easeInOut(duration: 0.5)) {
                    dragOffset = 0
                }
            }
        }
)
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView` and `BottomSheet`:

```swift
#Preview {
    ContentView()
}

#Preview {
    @Previewable @State var showSheet: Bool = false
    BottomSheet(isPresented: $showSheet)
}
```

## How to Run
1. Open **BottomSheet.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap "Show More Info" to reveal the bottom sheet.

## Notes
- The bottom sheet slides up smoothly using `withAnimation`.
- Users can dismiss the sheet by dragging it downward.
- `@Binding` allows external control over the sheet’s visibility.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
