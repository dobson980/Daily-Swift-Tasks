# GroupBox

A small SwiftUI demo showing how to use `GroupBox` and custom styles to organize related content.

## Overview

**GroupBox** is a SwiftUI sample that explores how `GroupBox` can group agreement text and a simple music player UI, including applying a custom `GroupBoxStyle` for a card-like appearance.

## Screenshot

> _Add a screenshot of the GroupBox demo running in the simulator here._
>
> Example:
>
> `![GroupBox](https://github.com/user-attachments/assets/your-screenshot-id)`

## Features

- Uses `GroupBox` to visually separate an end-user agreement from playback controls.
- Demonstrates nesting `GroupBox` views to create clear sections like "Now Playing" and "Previously Playing".
- Introduces a custom `MusicGroupBoxStyle` to give music sections a distinct, card-like style.
- Leverages common SwiftUI patterns such as `@State`, `ScrollView`, `ProgressView`, and system SF Symbols for controls.

## Code Breakdown

### 🧾 End-User Agreement Section

`ContentView` uses a `GroupBox` to wrap scrollable agreement text with a toggle that binds to `@State`:

```swift
@State private var userAgreed: Bool = false

GroupBox {
    ScrollView {
        Text(agreementText)
            .foregroundColor(.secondary)
    }
    .frame(height: 125)

    Toggle(isOn: $userAgreed) {
        Text("I agree to the above terms")
    }
} label: {
    Label("End-User Agreement", systemImage: "building.columns")
        .foregroundColor(.primary)
        .font(.title)
}
```

### 🎵 Nested GroupBoxes for Music

The music sections are built by nesting a `MusicPlayerView` inside an inner `GroupBox`, then wrapping that in an outer one with a label:

```swift
GroupBox {
    GroupBox {
        MusicPlayerView()
    }
} label: {
    Label("Now Playing", systemImage: "music.note")
        .foregroundColor(.pink)
}
```

### 🎚️ Custom GroupBoxStyle

`MusicGroupBoxStyle` customizes how group boxes are drawn for the "Previously Playing" section:

```swift
struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
+                .bold()
+                .foregroundStyle(.pink)
+
+            configuration.content
+        }
+        .padding()
+        .background(
+            .regularMaterial,
+            in: RoundedRectangle(cornerRadius: 16)
+        )
+    }
+}
+
+extension GroupBoxStyle where Self == MusicGroupBoxStyle {
+    static var music: MusicGroupBoxStyle { .init() }
+}
```

This lets you apply the style succinctly:

```swift
.groupBoxStyle(.music)
```

### ▶️ MusicPlayerView Layout

`MusicPlayerView` provides a simple, static music player layout used inside the group boxes:

```swift
VStack {
    HStack {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 50, height: 50)
            .foregroundStyle(.secondary)

        VStack(alignment: .leading, spacing: 2) {
            Text("Cool Song Title")
                .font(.headline.bold())

            Text("Artist Name")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }

        Spacer()
    }
    .padding(.bottom, 8)

    ProgressView(value: 0.4, total: 1)
        .tint(.secondary)
        .padding(.bottom, 20)

    HStack(spacing: 30) {
        Image(systemName: "backward.fill")
        Image(systemName: "pause.fill")
        Image(systemName: "forward.fill")
    }
    .foregroundStyle(.secondary)
    .font(.title)
}
```

## How to Run

1. Open **GroupBox.xcodeproj** in Xcode.
2. Select an iOS simulator or a connected device.
3. Run the project (Cmd + R).
4. Scroll through the agreement text, toggle the consent switch, and compare the "Now Playing" and "Previously Playing" group boxes to see the custom style in action.

## Notes

- The agreement text is placeholder lorem ipsum used to demonstrate scrolling inside a `GroupBox`.
- The music player is static and does not actually control audio playback—it focuses on layout and styling.
- The `.music` style is applied only to the "Previously Playing" section so you can compare the default and custom styles side by side.

## Technologies Used

- `SwiftUI`
- `GroupBox` and `GroupBoxStyle`
- `@State` for simple local state management
- `ScrollView`, `ProgressView`, `Label`, and SF Symbols

---
🚀 *Part of the Daily Swift Tasks learning journey!*