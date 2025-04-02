# SegmentSwiper

**SegmentSwiper** is a SwiftUI iOS application that showcases the use of a segmented control (`Picker`) paired with a `TabView` to create a smooth swipeable interface with multiple themed views. This project demonstrates how to combine `TabView`, `Picker`, and layout modifiers to create a clean, interactive UI with full-screen content switching.

---

## ✨ Features

- `TabView` with custom page style and swipeable navigation
- `Picker` for segment-based tab control
- Themed full-screen views: Blue, Green, and Orange
- Gradient backgrounds and large, styled title text
- Safe area management for full-screen UI
- Responsive layout using SwiftUI best practices

---

## 📂 Project Structure

| File | Description |
|------|-------------|
| `ContentView.swift` | Main view with the `TabView` and `Picker` |
| `BlueView.swift` | Fullscreen view with a blue gradient and title |
| `GreenView.swift` | Fullscreen view with a green gradient and title |
| `OrangeView.swift` | Fullscreen view with an orange gradient and title |
| `SegmentSwiperApp.swift` | App entry point using `@main` and `WindowGroup` |

---

## 📸 Screenshots

> Each tab displays a full-screen gradient view with corresponding color and text content.

---

## 🛠 Requirements

- Xcode 15+
- iOS 17+
- Swift 5.9+

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/SegmentSwiper.git
   cd SegmentSwiper
   ```

2. Open the project in Xcode:
   ```bash
   open SegmentSwiper.xcodeproj
   ```

3. Run the app on the simulator or your iOS device.

---

## 📚 Learning Focus

This project demonstrates:
- State-driven UI with `@State` and `@Binding`
- Custom styling of `Picker` components
- Use of `PageTabViewStyle` for swipe navigation
- Fullscreen view design using `.ignoresSafeArea()`

---

## 🧼 Future Improvements

- Fix the hardcoded placeholder text in `GreenView` and `OrangeView` to reflect their correct content.
- Add animation transitions between tabs.
- Enhance accessibility with appropriate modifiers.

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
