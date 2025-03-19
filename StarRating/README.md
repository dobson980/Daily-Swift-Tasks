# StarRating

## Overview
**StarRating** is a SwiftUI project that allows users to rate an app using a 5-star rating system. The project includes interactive stars that update the rating dynamically when tapped.

![StarRating](https://github.com/user-attachments/assets/4a740797-ea7f-442f-9910-f9df4913e0c0)

## Features
- Uses `@Binding` to allow external control of the rating.
- Implements an interactive star-based rating system with `Button` elements.
- Displays the current rating numerically when a selection is made.
- Uses `Image(systemName:)` for SF Symbols to visually represent stars.

## Code Breakdown

### 🔄 Managing the Rating State
A `@State` property in `ContentView` tracks the user-selected rating:

```swift
@State private var rating = 0
```

### 🏗️ Structuring the ContentView
A `VStack` arranges the title, `StarRatingView`, and selected rating text:

```swift
VStack {
    Text("Rate my App!")
        .font(.system(size: 30))
        .padding(.bottom, 50)

    StarRatingView(rating: $rating)
        .padding(.bottom, 50)

    Text("You rated this app \(rating) stars.")
        .opacity(rating == 0 ? 0 : 1)
}
.padding()
```

### ⭐ Implementing the Star Rating View
A `ForEach` loop generates five buttons representing stars:

```swift
HStack {
    ForEach(1...5, id: \.self) { index in
        Button {
            rating = index
        } label: {
            Image(systemName: index <= rating ? "star.fill" : "star")
                .foregroundColor(.yellow)
                .font(.title)
        }
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `StarRatingView`:

```swift
#Preview {
    @Previewable @State var rating = 4
    StarRatingView(rating: $rating)
}
```

## How to Run
1. Open **StarRating.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap the stars to update the rating.

## Notes
- `@Binding` allows `StarRatingView` to update the `rating` externally.
- `Image(systemName: "star.fill")` represents a filled star, while `"star"` is unfilled.
- The rating text fades out when no rating is selected.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
