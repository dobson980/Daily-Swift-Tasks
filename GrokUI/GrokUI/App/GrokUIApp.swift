//
//  GrokUIApp.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Entry point for the **GrokUI** demo app.
///
/// This app focuses on recreating a side-docked chat interface inspired by
/// modern AI tools (like Grok, ChatGPT, etc.), with a draggable sidebar and
/// custom chat controls built in SwiftUI.
@main
struct GrokUIApp: App {
    var body: some Scene {
        WindowGroup {
            // `ContentView` hosts the main chat UI and coordinates the
            // side menu state and gestures.
            ContentView()
        }
    }
}
