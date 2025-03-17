# ErrorBanner

## Overview
**ErrorBanner** is a SwiftUI project demonstrating how to display a temporary error message banner at the top of the screen. The app also includes a "self-destruct" feature, which triggers a countdown before displaying the error banner.

## Features
- Implements `ErrorBannerView` to display an animated error banner.
- Uses `@State` to control the countdown and banner visibility.
- Implements an animated countdown before showing the error message.
- Includes a button that triggers the countdown and temporarily disables itself.

## Code Breakdown

### 🔄 Managing Countdown & Error State
Several `@State` properties handle the countdown and error banner:

```swift
@State private var count: Int = 3
@State private var selfDestructed: Bool = false
@State private var countingDown: Bool = false
```

### 🏗️ Structuring the ContentView
A `ZStack` positions the error banner behind the main content:

```swift
ZStack {
    ErrorBannerView(presentError: $selfDestructed, errorMessage: "BOOM!!!")

    VStack {
        Spacer()

        Text("\(count)")
            .font(.system(size: 80, weight: .bold))
            .opacity(countingDown ? 1 : 0)

        Spacer()

        Button {
            triggerSelfDestruct()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill((selfDestructed || countingDown) ? Color(.systemGray6) : Color.red)
                    .frame(width: 200, height: 50)

                Text("Trigger Self Destruct")
                    .foregroundStyle((selfDestructed || countingDown) ? Color.black : Color.white)
            }
        }
        .disabled(selfDestructed || countingDown)
    }
    .padding()
}
```

### 🎬 Implementing the Countdown Logic
The `triggerSelfDestruct()` function handles the countdown and error banner display:

```swift
func triggerSelfDestruct() {
    Task {
        countingDown = true

        while count > 0 {
            try await Task.sleep(for: .seconds(1))
            withAnimation(.bouncy) {
                count -= 1
            }
        }

        countingDown = false
        selfDestructed = true

        try await Task.sleep(for: .seconds(5))

        count = 3
        selfDestructed = false
    }
}
```

### 🚨 Implementing the Error Banner
The `ErrorBannerView` slides into view when `presentError` is true:

```swift
struct ErrorBannerView: View {
    @Binding var presentError: Bool
    @State var errorMessage: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
                .frame(height: 60)

            Text(errorMessage)
                .foregroundStyle(.white)
                .font(.headline)
        }
        .padding()
        .animation(.easeInOut(duration: 0.5), value: presentError)
        .offset(y: presentError ? -350 : -800)
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView` and `ErrorBannerView`:

```swift
#Preview {
    ContentView()
}

#Preview("Presented") {
    @Previewable @State var errorObserved: Bool = true
    @Previewable @State var errorMessage: String = "Something went wrong!"
    ErrorBannerView(presentError: $errorObserved, errorMessage: errorMessage)
}
```

## How to Run
1. Open **ErrorBanner.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap "Trigger Self Destruct" to start the countdown.

## Notes
- `Task.sleep(for: .seconds(1))` ensures the countdown updates every second.
- `withAnimation(.bouncy)` smoothly animates the countdown text.
- The error banner automatically disappears after 5 seconds.

---
🚀 *Part of the Daily Swift Tasks learning journey!*