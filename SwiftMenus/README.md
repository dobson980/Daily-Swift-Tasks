# SwiftMenus

## Overview
**SwiftMenus** is a SwiftUI project demonstrating how to use `NavigationView`, `ToolbarItem`, and `Menu` to create an interactive toolbar menu. This project shows how to structure menus with sections, actions, and nested menus.

![SwiftMenus](https://github.com/user-attachments/assets/0e7ffdef-99ff-4ba3-abdc-2edcd9626a77)

## Features
- Uses `NavigationView` to wrap a structured layout.
- Implements a `ToolbarItem` to add a menu button in the navigation bar.
- Organizes menu options into sections: **Actions** and **Settings**.
- Supports nested menus for structured sub-actions.

## Code Breakdown

### 🏗️ Structuring the ContentView
A `VStack` arranges the title and description, wrapped inside a `NavigationView`:

```swift
NavigationView {
    VStack {
        Text("Menu Mayhem!")
            .font(.system(size: 50))
            .foregroundStyle(
                .linearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
            )

        Text("Open the menu in the top right to explore the kinds of layouts you can make with SwiftUI Menus")
    }
    .padding(35)
    .toolbar {
        ToolbarItem {
            Menu {
                Section("Actions") {
                    Button("Copy", action: {})
                    Button("Paste", action: {})
                    Button("Cut", action: {})
                    Button("Delete", role: .destructive, action: {})
                }
                Section("Settings") {
                    Button("Preferences", action: {})
                    Button("Account", action: {})
                    Button("Logout", action: {})
                    Menu("Help") {
                        Button("FAQ", action: {})
                        Button("Contact", action: {})
                    }
                }
            } label: {
                Label("Main Menu", systemImage: "line.horizontal.3")
            }
            .menuOrder(.fixed)
        }
    }
}
```

### 📌 Implementing the Toolbar Menu
The `ToolbarItem` wraps the menu:

```swift
ToolbarItem {
    Menu {
        Section("Actions") {
            Button("Copy", action: {})
            Button("Paste", action: {})
            Button("Cut", action: {})
            Button("Delete", role: .destructive, action: {})
        }
        Section("Settings") {
            Button("Preferences", action: {})
            Button("Account", action: {})
            Button("Logout", action: {})
            Menu("Help") {
                Button("FAQ", action: {})
                Button("Contact", action: {})
            }
        }
    } label: {
        Label("Main Menu", systemImage: "line.horizontal.3")
    }
    .menuOrder(.fixed)
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
1. Open **SwiftMenus.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap the menu button in the top-right toolbar.

## Notes
- `ToolbarItem` ensures the menu is always accessible in the navigation bar.
- `.menuOrder(.fixed)` keeps the menu items in a structured order.
- Nested menus provide additional organization within the settings section.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
