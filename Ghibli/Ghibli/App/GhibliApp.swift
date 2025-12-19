//
//  GhibliApp.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import SwiftUI

/// Entry point for the **Ghibli** learning app.
///
/// The only responsibility of the `App` is to boot up `ContentView` inside
/// a `WindowGroup` so multiple windows (or scenes on iPad) can be created if needed.
/// The call to `.setAppearanceTheme()` at launch time ensures the persisted
/// appearance preference from `SettingsScreen` is applied consistently across the UI.
@main
struct GhibliApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Reads the user's saved appearance preference and applies the matching color scheme.
                .setAppearanceTheme()
        }
    }
}
