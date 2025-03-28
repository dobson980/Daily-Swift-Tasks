# PushNotification

## Overview
**PushNotification** is a SwiftUI-based iOS application that demonstrates how to check, request, and display local push notification settings. It provides a fully interactive UI for testing notification permissions and includes color-coded visual feedback for each setting.

<img src="https://github.com/user-attachments/assets/6ab9ca76-220f-4ff4-973d-215c0adce6eb" width="442" alt="PushNotification Demo">

## Features
- 📬 Requests push notification permissions from the user
- 📊 Displays current notification settings (alerts, badges, sounds, etc.)
- 🔔 Schedules and delivers local test notifications
- 🟢 Color-coded views for enabled/disabled/unsupported settings
- ⚙️ Button to open system notification settings directly
- 📱 Compatible with the latest SwiftUI lifecycle and uses `UNUserNotificationCenter`

## Architecture
The project follows a clean modular structure:
- `ContentView.swift`: Main UI and app logic
- `SettingView.swift`: Reusable component for individual setting rows
- `AuthorizationStatusView.swift`: Specialized view for overall authorization status
- `NotificationSettingsDescriptors.swift`: Extensions to provide readable descriptions and semantic colors
- `AppDelegate.swift`: Implements `UNUserNotificationCenterDelegate` to show notifications while in foreground

## How It Works

### 1. Requesting Permissions
The app requests authorization for `.alert`, `.badge`, and `.sound` notifications. If granted, the app proceeds to query detailed settings.

### 2. Displaying Settings
Using SwiftUI custom views, each notification setting (e.g. Alert, Badge, Sound) is shown with:
- Human-readable description (`Enabled`, `Disabled`, `Not Supported`)
- Semantic color: Green (enabled), Red (disabled), Gray (unsupported)

### 3. Sending a Test Notification
When you tap **"Notify Me!"**, the app:
- Schedules a local notification after 3 seconds
- Uses a custom sound named `rupee.wav` (must be added to your bundle)
- Supports showing notifications while app is in the foreground

### 4. Opening System Settings
You can also tap **"Open Notification Settings"** to jump to the app’s system notification configuration in iOS Settings.

## Preview Support
✅ This project uses Xcode’s `#Preview` for all major views including:
- `SettingView`
- `AuthorizationStatusView`
- `ContentView`

## Notification Flow Diagram

```
[App Launches]
       ↓
[Request Notification Permission]
       ↓
[User Grants or Denies]
       ↓
[App Fetches Settings] ← App Returns to Foreground
       ↓
[Display Color-Coded Status]
       ↓
[Send Notification] → [Trigger Notification in 3 Seconds]
```

## How to Run
1. Open `PushNotification.xcodeproj` in Xcode.
2. Add a sound file named `rupee.wav` to your asset bundle if testing custom sounds.
3. Build and run on a physical device (or simulator with limitations).
4. Allow notifications when prompted.
5. Tap "Notify Me!" to test.

## Permissions & Considerations
- Some settings may show as "Not Supported" depending on simulator/device.
- Notifications must be enabled in Settings > Your App > Notifications.

## License
This app is intended for learning and experimentation with push notification APIs and SwiftUI.

---

🧠 *Part of the Daily Swift Tasks learning journey.*
