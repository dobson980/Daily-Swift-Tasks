//
//  withAnimation_vs_animationApp.swift
//  withAnimation_vs_animation
//
//  Created by Tom Dobson on 12/9/25.
//

import SwiftUI

/// Entry point for the **withAnimation_vs_animation** demo app.
///
/// This app is intentionally small and focused. Its only job is to
/// launch `ContentView`, which contains the side‑by‑side comparison
/// of the two animation approaches.
@main
struct withAnimation_vs_animationApp: App {
    var body: some Scene {
        WindowGroup {
            // Root view of the app showing the tab-based comparison UI.
            ContentView()
        }
    }
}
