# ConditionalContent

## Overview
**ConditionalContent** is a SwiftUI project demonstrating how to display content conditionally based on state changes. The project features a button that toggles the visibility of additional details using smooth animations.

![entraContent](https://github.com/user-attachments/assets/c798b8b2-5426-4883-8dac-678bc03b119d)

## Features
- Uses `@State` to control the visibility of extra content.
- Implements an asymmetric transition effect (`.slide` for insertion, `.opacity` for removal).
- Utilizes `withAnimation(.bouncy)` for a smooth, engaging toggle effect.
- Displays structured information with a title, description, and optional extra content.

## Code Breakdown

### 📌 Managing State for Conditional Content
A `@State` property tracks whether additional content should be shown:

```swift
@State private var showExtraContent: Bool = false
```

### 🏗️ Structuring the Content View
The `VStack` arranges the title, description, and optional extra content:

```swift
VStack(spacing: 30) {
    Text("\(sampleDetailItem.title)")
        .font(.largeTitle)
        .fontWeight(.bold)

    Text("\(sampleDetailItem.description)")
        .font(.callout)

    if showExtraContent {
        Text("\(sampleDetailItem.extraContent)")
            .font(.caption)
            .transition(.asymmetric(insertion: .slide, removal: .opacity))
    }

    Button {
        withAnimation(.bouncy) {
            showExtraContent.toggle()
        }
    } label: {
        Image(systemName: showExtraContent ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
    }
}
.padding(20)
```

### 🗂️ Defining the Data Model
A simple struct models the displayed content:

```swift
struct DetailItem {
    let title: String
    let description: String
    let extraContent: String
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
1. Open **ConditionalContent.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the interactive content toggle in action.

## Notes
- `withAnimation(.bouncy)` creates a smooth, natural feel when toggling content.
- The `.transition(.asymmetric(insertion: .slide, removal: .opacity))` enhances the visibility effect.
- The project demonstrates best practices for conditional UI rendering in SwiftUI.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
