# SideBar

## Overview
**SideBar** is a SwiftUI project demonstrating how to create a slide-in sidebar menu using `ZStack` and `@State`. The sidebar appears when triggered by a button and smoothly toggles visibility.

## Features
- Uses `@State` to control sidebar visibility.
- Implements `ZStack` to layer the sidebar behind the main content.
- Provides a button to toggle the sidebar open and closed.
- Supports dynamic sidebar visibility using a `Binding`.

## Code Breakdown

### 🔄 Managing Sidebar Visibility
A `@State` property tracks whether the sidebar is shown:

```swift
@State private var showSidebar = false
```

### 🏗️ Structuring the ContentView
A `ZStack` places the sidebar behind the main content:

```swift
ZStack {
    CustomSideBar(isPresented: $showSidebar)
    
    VStack {
        Button("Open Sidebar") {
            showSidebar.toggle()
        }
    }
    .padding()
}
```

### 📂 Implementing the Sidebar (CustomSideBar)
The sidebar component receives a `Binding` to control its position:

```swift
struct CustomSideBar: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Sidebar Content")
                .font(.title)
        }
        .frame(width: 250, alignment: .leading)
        .background(Color.gray.opacity(0.8))
        .offset(x: isPresented ? 0 : -250)
        .animation(.easeInOut, value: isPresented)
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **SideBar.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap "Open Sidebar" to toggle visibility.

## Notes
- The sidebar smoothly slides in and out using `.offset` and `.animation`.
- The `@Binding` mechanism allows `CustomSideBar` to react to state changes.
- The `ZStack` ensures the sidebar stays beneath the main content.

---
🚀 *Part of the Daily Swift Tasks learning journey!*