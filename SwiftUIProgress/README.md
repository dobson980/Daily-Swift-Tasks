# SwiftUIProgress

## Overview
**SwiftUIProgress** is a SwiftUI project that demonstrates a simple animated progress bar with state management. The project includes a start/reset button that simulates a download process using async tasks and animations.

![progressbar](https://github.com/user-attachments/assets/2064a117-5c66-4d22-a68b-027ba35302af)

## Features
- Uses `@State` properties to manage progress and animation.
- Implements a custom progress bar using `Capsule` and `HStack`.
- Uses `Task` to simulate a downloading process.
- Handles cancellation of the progress update.

## Code Breakdown

### 🛠️ Creating the Progress Bar
The progress bar is drawn using a `Capsule` inside an `HStack`, adjusting its width based on the progress state:

```swift
HStack {
    Capsule()
        .foregroundColor(.blue)
        .frame(
            width: max(5, progress * (geometry.size.width - (10 * 2))),
            height: 20
        )
        .padding(.horizontal, 10)
        .animation(.easeOut, value: progress)
}
.frame(maxWidth: .infinity, alignment: .leading)
```

### ⏳ Simulating Download Progress
The app starts a simulated download process when the user presses the **Start the download** button:

```swift
downloadTask = Task {
    while progress < 1 {
        try? await Task.sleep(nanoseconds: 50_000_000) // Pause briefly.
        if Task.isCancelled { return } // Exit if canceled.
        progress = min(progress + 0.005, 1.0) // Increment progress.
    }
    progressOpacity = 0
    downloading.toggle()
    downloadTask = nil
}
```

### 🛑 Canceling the Download
If the user presses **Reset**, the app cancels the download task and resets progress:

```swift
if downloading {
    downloadTask?.cancel()
    downloadTask = nil
    downloading.toggle()
    progress = 0.0
    progressOpacity = 0.0
}
```

## How to Run
1. Open **SwiftUIProgress.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the progress bar in action.

## Notes
- The project demonstrates Swift concurrency using `Task` for smooth progress updates.
- Enhancements could include customizable progress speeds or a more complex UI.

---

🚀 *Part of the Daily Swift Tasks learning journey!*
