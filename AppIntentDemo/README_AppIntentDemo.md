# AppIntentDemo

## Overview
**AppIntentDemo** is a SwiftUI project demonstrating how to control UI focus states using **App Intents** in iOS/macOS applications. The app allows system-wide shortcuts or voice commands (via Siri) to direct focus to specific text fields like email or password, offering a clean example of App Intent integration.

## Features
- Two-way binding of UI focus using `@FocusState` and an observable controller.
- Integration with App Intents framework to programmatically focus fields.
- A simple interface with email and password text fields.
- Use of `AppIntentsController` singleton to share state across layers.
- Enum-based field targeting for maintainable logic.

## Components

### FocusedField Enum
Defines focusable targets:

    enum FocusedField: String {
        case none, email, password
    }

### AppIntentsController
An observable singleton used to track the currently focused field and synchronize UI:

    @Observable
    class AppIntentsController {
        static let shared = AppIntentsController()
        var focusedField: FocusedField = .none
    }

### FocusedTextFieldIntent
Defines an App Intent to change focus:

    struct FocusedTextFieldIntent: AppIntent {
        @Parameter(title: "Focused Field") var focusedField: String

        func perform() async throws -> some IntentResult {
            AppIntentsController.shared.focusedField = FocusedField(rawValue: focusedField.lowercased())!
            return .result()
        }
    }

### ContentView
Main UI containing:
- Email and password fields
- Focus behavior using `@FocusState`
- Auto-updates when `AppIntentsController.shared.focusedField` changes

## How to Run

1. Open `AppIntentDemo.xcodeproj` in Xcode.
2. Run the project on a macOS or iOS simulator/device.
3. To test intents:
   - Trigger `FocusedTextFieldIntent` via Shortcuts or Siri with parameter "email" or "password".
   - Focus should shift accordingly.

## Requirements

- Swift 5.9+
- macOS 14+ or iOS 17+
- Xcode 15+
- App must be set up with the correct entitlements for App Intents.

## Notes

- This project uses SwiftUI’s new `@Observable` macro and App Intents integration.
- Designed to demonstrate developer workflows around programmatic UI control.

---

📅 Generated on 2025-04-01 as part of the Daily Swift Tasks learning journey.
