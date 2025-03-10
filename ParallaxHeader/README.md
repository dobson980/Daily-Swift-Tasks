# ParallaxHeader

## Overview
**ParallaxHeader** is a SwiftUI project demonstrating how to create a scrolling effect where the background image moves at a different speed than the foreground content, achieving a parallax effect.

![ParallaxHeader](https://github.com/user-attachments/assets/58184676-7e01-4aed-8757-450728acdb28)

## Features
- Uses `ScrollView` to create a scrollable foreground.
- Implements `GeometryReader` to track the vertical scroll offset.
- Applies a parallax effect by adjusting the background image’s position dynamically.
- Ensures a smooth UI experience by handling safe areas correctly.

## Code Breakdown

### 🎛️ Managing Scroll Offset
A `@State` variable tracks how far the user has scrolled:

```swift
@State private var scrollOffset: CGFloat = 0
```

### 🌄 Creating the Parallax Background
A `GeometryReader` adjusts the background image’s vertical offset based on scroll position:

```swift
GeometryReader { geo in
    Image("space")
        .resizable()
        .scaledToFill()
        .frame(width: geo.size.width, height: geo.size.height * 3.0)
        .offset(y: scrollOffset < 0 ? scrollOffset * 0.3 : 0) // Parallax effect
        .clipped()
        .ignoresSafeArea()
}
```

### 📜 Tracking Scroll Offset with GeometryReader
A hidden `GeometryReader` detects the scroll position and updates `scrollOffset`:

```swift
GeometryReader { scrollGeo in
    Color.clear
        .onChange(of: scrollGeo.frame(in: .global).minY) { oldValue, newValue in
            scrollOffset = newValue
        }
}
.frame(height: 0) // Invisible, used only for tracking
```

### 🏗️ Structuring the Foreground Content
A `ScrollView` holds 50 numbered text items:

```swift
ScrollView {
    VStack(spacing: 20) {
        ForEach(0..<50) { index in
            Text("Item \(index)")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(8)
        }
    }
    .padding(.top, 40)
    .padding(.horizontal)
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
1. Open **ParallaxHeader.xcodeproj** in Xcode.
2. Ensure an image named `"space"` is added to the asset catalog.
3. Select an iOS simulator or device.
4. Run the project (`Cmd + R`) and scroll to see the parallax effect.

## Notes
- The background image moves at 30% of the scroll speed (`scrollOffset * 0.3`).
- The `.ignoresSafeArea()` modifier ensures the image fills the screen.
- The semi-transparent black background behind text improves readability.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
