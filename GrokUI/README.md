# GrokUI

## Overview

**GrokUI** is a SwiftUI demo that recreates a modern AI chat interface with a
sliding sidebar, gesture-driven navigation, and custom chat controls. The focus
is on coordinating layout, state, and gestures to mirror apps like Grok or
ChatGPT on macOS and iPadOS.

## Screenshot

> _Add a screenshot here once you have one rendered in the simulator._
>
> `![GrokUI](https://github.com/user-attachments/assets/your-image-id-here)`

## Features

- Sliding sidebar that can be opened via a two-finger pan gesture or menu button.
- Main chat surface with custom toolbar, quick actions, and text input.
- Simple routing using an `enum` (`AvailableViews`) to swap between Chat,
  Notifications, Profile, and Settings.
- UIKit `UIPanGestureRecognizer` bridged into SwiftUI with
  `UIGestureRecognizerRepresentable`.
- Reusable, focused components for sidebar items, action buttons, and profile
  footer.

## Code Breakdown

### 🧭 `ContentView` – coordinating layout and gestures

`ContentView` is the main container that wires up the sidebar, the active
content view, and the pan gesture that slides the UI around.

```swift
@State private var dragOffset: CGFloat = 0
@State private var isMenuOpen: Bool = false
@State private var currentView: AvailableViews = .chat
@State private var enablePushButton = true
@FocusState private var isKeyboardOpen: Bool

GeometryReader { geo in
    let menuWidth = geo.size.width / 1.5
    let closedMenuX = -menuWidth
    let openMenuX: CGFloat = 0
    let contentBaseX: CGFloat = isMenuOpen ? menuWidth : 0

    ZStack {
        // Content and sidebar composed here…
    }
    .gesture(
        PanGestureWrapper { gesture in
            let rawDrag = gesture.translation(in: gesture.view).x
            // Map the pan into `dragOffset` and decide when to open/close.
        }
    )
}
```

Key ideas:

- The sidebar and content both use `dragOffset` plus a base offset derived from
  `isMenuOpen` to stay in sync.
- The custom pan gesture dismisses the keyboard and temporarily disables the
  push-to-talk button for a clean interaction.

### 🪟 `SideView` – building the sidebar

`SideView` composes the search bar, quick actions, navigation items, and
conversation history into a single vertical column.

```swift
struct SideView: View {
    @Binding var currentView: AvailableViews
    @Binding var enable: Bool
    var close: () -> Void

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                SearchBar(enable: $enable, close: close)
                SideViewQuickActions()
                SideBarNavigationActions(currentView: $currentView)
                ConversationHistory()
                Spacer()
                SideBarProfile()
            }
            .padding(.top, 32)
            .padding(.horizontal)
        }
    }
}
```

This keeps the sidebar purely declarative: all state that affects routing or
interactions is passed in via bindings from `ContentView`.

### 💬 `ChatView` – the chat surface

`ChatView` focuses on the visual chat experience: header actions, Grok logo,
quick actions, and the input area.

```swift
struct ChatView: View {
    @Binding var enable: Bool
    @FocusState var isFocused: Bool
    var open: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GrokLogo()

            VStack {
                HStack {
                    MenuButton(enable: $enable, open: open)
                    Spacer()
                    Image(systemName: "person.fill")
                }
                .padding()

                Spacer()

                ActionButtonBar()

                VStack(spacing: 24) {
                    ChatField()
                    ActionToolBar()
                }
                .padding(.top, 10)
            }
            .padding()
            .background(.gray.opacity(0.3), in: .rect(cornerRadius: 30))
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}
```

The view intentionally stays stateless with respect to chat messages so that the
layout and composition are the main learning focus.

### 🧲 `PanGestureWrapper` – bridging UIKit gestures

`PanGestureWrapper` shows how to wrap a UIKit gesture recognizer and use it
inside SwiftUI when you need more control than `DragGesture` alone.

```swift
struct PanGestureWrapper: UIGestureRecognizerRepresentable {
    var handle: (UIPanGestureRecognizer) -> ()

    func makeUIGestureRecognizer(context: Context) -> UIPanGestureRecognizer {
        UIPanGestureRecognizer()
    }

    func updateUIGestureRecognizer(_ recognizer: UIPanGestureRecognizer, context: Context) {
        // Configuration could be updated here.
    }

    func handleUIGestureRecognizerAction(_ recognizer: UIPanGestureRecognizer, context: Context) {
        handle(recognizer)
    }
}
```

This pattern is powerful whenever you want to fine-tune gesture behavior while
keeping your SwiftUI view trees clean.

## How to Run

1. Open **GrokUI.xcodeproj** in Xcode.
2. Select an iOS simulator (for example, iPhone 16 Pro) or a connected device.
3. Build and run the app (⌘R).
4. In the running app:
   - Use the menu button in the top-left of the chat view to toggle the sidebar.
   - Try a two-finger horizontal pan to slide the sidebar in and out.
   - Tap different navigation items (Chat, Notifications, Profile, Settings) to
     switch the main content.

## Notes

- The chat text field uses a constant binding in this demo; introduce your own
  `@State` or `@Binding` to wire up real input handling.
- Conversation history is hard-coded to keep the sample focused on layout and
  navigation instead of persistence.
- The sidebar gesture is intentionally simple: it uses the drag distance and
  direction to decide whether to snap open or closed.
- UI colors and SF Symbols are chosen to roughly echo modern AI tools but can
  be easily swapped out to fit your own branding.

## Project Structure

- `App/` – Application entry point (`GrokUIApp`).
- `Model/` – Simple enums and types like `AvailableViews` used for routing.
- `Utilities/` – Helpers such as `PanGestureWrapper` for bridging UIKit and
  SwiftUI.
- `Views/` – Top-level screens (`ContentView`, `ChatView`, `ProfileView`,
  `SettingsView`, `NotificationsView`, `SideView`).
- `Views/Components/ChatView/` – Reusable building blocks for the chat surface
  (action bar, toolbar, logo, menu button, text field).
- `Views/Components/Sidebar/` – Sidebar components (search bar, quick actions,
  navigation buttons, conversation history, profile footer).

---
🚀 *Part of the Daily Swift Tasks learning journey!*
