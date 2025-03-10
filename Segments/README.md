# Segments

## Overview
**Segments** is a SwiftUI project demonstrating how to create a custom segmented control using buttons and bindings. The project allows users to select different segments, updating the displayed selection dynamically.

![Segments](https://github.com/user-attachments/assets/8f32d147-c00f-4b41-8a80-d076e4a7217d)

## Features
- Implements a `SegmentControl` that updates the selected segment using `@Binding`.
- Uses an enum (`Segments`) to define segment options.
- Animates transitions between segments for a smooth UI experience.
- Displays the currently selected segment in `ContentView`.

## Code Breakdown

### 🔄 Managing the Selected Segment
A `@State` property in `ContentView` keeps track of the active segment:

```swift
@State private var selectedSegment: Segments = .First
```

### 🏗️ Structuring the ContentView
The `VStack` arranges the selected segment text and custom segment control:

```swift
VStack {
    Spacer()
    
    Text("\(selectedSegment.title) segment has been selected")

    Spacer()

    SegmentControl(selectedSegment: $selectedSegment)
}
.padding()
```

### 🎛️ Implementing the Custom Segmented Control
A `ForEach` loop generates buttons for all segment cases:

```swift
HStack {
    ForEach(Segments.allCases, id: \.self) { segment in
        Button {
            print("\(segment.title) button tapped.")
            withAnimation {
                selectedSegment = segment
            }
        } label: {
            Text(segment.title)
        }
        .buttonStyle(.borderedProminent)
        .tint(segment == selectedSegment ? .none : .gray)
    }
}
```

### 🗂️ Defining the Segments Enum
The `Segments` enum provides segment options and titles:

```swift
enum Segments: CaseIterable {
    case First, Second, Third

    var title: String {
        switch self {
        case .First: return "First"
        case .Second: return "Second"
        case .Third: return "Third"
        }
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView` and `SegmentControl`:

```swift
#Preview {
    ContentView()
}

#Preview {
    @Previewable @State var selectedSegment: Segments = .First
    SegmentControl(selectedSegment: $selectedSegment)
}
```

## How to Run
1. Open **Segments.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap the segments to switch selections.

## Notes
- The `@Binding` mechanism ensures changes propagate between `ContentView` and `SegmentControl`.
- `withAnimation` creates smooth transitions between segment changes.
- `.buttonStyle(.borderedProminent)` provides a system-like button appearance.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
