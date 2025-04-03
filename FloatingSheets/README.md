# FloatingSheets – SwiftUI Subscription Interface with Custom Sheet Presentation

**FloatingSheets** is a modern SwiftUI app that demonstrates a beautifully designed, interactive subscription interface using advanced sheet presentation techniques. This app utilizes custom tray-like sheets (bottom drawers), smooth transitions, and state-driven views to manage subscription workflows like selecting services, choosing a subscription duration, and displaying status.

---

## ✨ Features

- ✅ Custom tray-style sheets using `.sheet()` modifiers with presentation detents
- ✅ Segmented view transitions between:
  - Subscription service selection
  - Predefined or custom durations (via keypad)
- ✅ Animated keypad input for entering a custom duration
- ✅ Subscription card showing selected action and days remaining
- ✅ Shared environment view model using `@Observable` (Swift macros)
- ✅ Programmatic shadow removal using `UIViewRepresentable`
- ✅ SwiftUI transitions: `.blurReplace`, `.snappy`, `.bouncy`

---

## 📁 Project Structure

| File                          | Description |
|-------------------------------|-------------|
| `FloatingSheetsApp.swift`     | App entry point with `WindowGroup` and injected `SubscriptionViewModel` |
| `ContentView.swift`           | Main interface switching between subscribe and detail views |
| `SubscriptionViewModel.swift` | Shared app state for selections and input |
| `SubscriptionSheet.swift`     | Service selector for actions like Game Pass or Apple TV |
| `PeriodSheet.swift`           | Grid-based UI to pick subscription duration |
| `CustomDurationSheet.swift`   | Numeric keypad interface to enter custom number of days |
| `SubscriptionDetailsCard.swift` | Displays current subscription info with gradients |
| `TrayHelper.swift`            | Advanced `.sheet()` customization: corner radius, detents, shadow removal |
| `Data.swift`                  | Static content models: `Action`, `Period`, and keypad definitions |

---

## 🧠 Concepts Demonstrated

- Use of `.sheet()` with `presentationDetents`, `.presentationBackground`, and `.presentationCornerRadius`
- Custom reusable `View` extension for system trays
- Shadow removal via UIKit bridge
- Focused keyboard control and view transitions
- SwiftUI environment and data flow using `@ObservableObject` (via macro)

---

## 🚀 Getting Started

1. Clone the repository
2. Open the project in Xcode 15 or later
3. Run the project on iOS 17+ simulator or device
4. Tap "Subscribe!" and navigate through:
   - Subscription options
   - Period picker
   - Custom duration keypad

---

## 🧩 Requirements

- iOS 17+
- Swift 5.9+
- Xcode 15+
- No external dependencies

---

## 📸 Screenshots

![FloatingSheets](https://github.com/user-attachments/assets/99cb519f-7d59-443f-a120-ae83a4637708)

---

## 👨‍💻 Author

**Thomas Dobson**  
> _Crafting beautiful and functional SwiftUI experiences._
