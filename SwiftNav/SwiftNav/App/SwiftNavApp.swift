//
//  SwiftNavApp.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Entry point for the **SwiftNav** demo app.
///
/// This app focuses on modern SwiftUI navigation using a shared
/// `NavigationManager` and a `NavigationStack` with a typed path.
@main
struct SwiftNavApp: App {
    var body: some Scene {
        WindowGroup {
            // The root view shows the home screen with buttons that
            // push different colored pages onto the navigation stack.
            ContentView()
        }
    }
}
