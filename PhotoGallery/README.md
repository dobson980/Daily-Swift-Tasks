# PhotoGallery

## Overview
**PhotoGallery** is a SwiftUI project demonstrating how to create a dynamic photo grid using `LazyVGrid`. The project loads image assets dynamically based on an index and displays them in a scrollable grid layout.

![PhotoGallery](https://github.com/user-attachments/assets/10a58a9f-40b7-41da-a8cc-e9e7cf030743)

## Features
- Uses `LazyVGrid` to create an adaptive grid layout.
- Loads images dynamically using `GalleryItem`.
- Implements a `ScrollView` to support scrolling.
- Applies rounded corners to images for a polished look.

## Code Breakdown

### 🏗️ Creating the Grid Layout
A `GridItem` array defines an adaptive grid where each column is at least 200 points wide:

```swift
let columns = [GridItem(.adaptive(minimum: 200))]
```

The `LazyVGrid` efficiently loads images only when they appear on the screen:

```swift
LazyVGrid(columns: columns) {
    ForEach(1..<15, id: \.self) { index in
        GalleryItem(imageIndex: index)
    }
}
```

### 📷 Implementing the GalleryItem View
Each `GalleryItem` loads an image based on its `imageIndex`:

```swift
struct GalleryItem: View {
    var imageIndex: Int

    var body: some View {
        Image("\(imageIndex)")
            .resizable()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView` and `GalleryItem`:

```swift
#Preview {
    ContentView()
}

#Preview {
    GalleryItem(imageIndex: 1)
}
```

## How to Run
1. Open **PhotoGallery.xcodeproj** in Xcode.
2. Ensure image assets are named numerically (e.g., `1.png`, `2.jpg`, etc.).
3. Select an iOS simulator or device.
4. Run the project (`Cmd + R`) and scroll through the photo gallery.

## Notes
- `LazyVGrid` improves performance by only rendering visible items.
- The adaptive layout ensures the grid adjusts based on screen size.
- Images are clipped with `RoundedRectangle(cornerRadius: 25)` for a smooth appearance.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
