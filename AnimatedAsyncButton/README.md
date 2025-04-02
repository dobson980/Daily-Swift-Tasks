# AnimatedAsyncButton

AnimatedAsyncButton is a SwiftUI demo app showcasing how to build an animated, async-capable button that visually reflects different transaction states such as analyzing, processing, success, and failure.

## ✨ Features

- Smooth animated button with visual feedback.
- Custom spinner animation using layered rotating arcs.
- Dynamic gradient background tied to transaction state.
- Reusable `AnimatedButton` component with async support.
- Defined transaction phases via an `enum`.

## 📁 Project Structure

- `ContentView.swift`: Main user interface showing the animated button and transaction state transitions.
- `AnimatedButton.swift`: Reusable, configurable button view with optional image or spinner.
- `Spinner.swift`: A SwiftUI spinner using custom animations and trim-based arc drawing.
- `AnimatedAsyncButtonApp.swift`: App entry point using SwiftUI's `@main` declaration.

## 🧠 Transaction State Enum

The app uses the `TransactionState` enum to manage UI changes and logic:

- `.idle`: Tap to start
- `.analyzing`: Reviewing payment
- `.processing`: Processing payment
- `.success`: Payment confirmed
- `.failure`: Payment failed

Each state includes a unique label, color, and optional system icon.

## 🚀 Usage

1. Run the app.
2. Tap the "Tap to Pay" button.
3. Watch the animated transitions as the state progresses.
4. Observe how the spinner and button label update with each phase.

## 🛠 Technologies Used

- Swift 5.9+
- SwiftUI (iOS 17+)
- Async/Await
- Custom ButtonStyle
- Animations and Transitions

## 🧪 Previews

All views are equipped with `#Preview` declarations for Xcode canvas testing.

## 📸 Screenshots

Not included in this README. Capture via simulator or device as needed.

---

Created by **Thomas Dobson** on April 2, 2025.
