//
//  FloatingSheetsApp.swift
//  FloatingSheets
//
//  Created by Thomas Dobson on 4/2/25.
//

import SwiftUI

/// The entry point for the FloatingSheets application.
///
/// This structure conforms to the `App` protocol and represents the main application.
/// It sets up the primary scene and injects a subscription view model into the environment,
/// allowing any child view to access subscription data.
@main
struct FloatingSheetsApp: App {
    /// The content and configuration of the main scene.
    ///
    /// The `body` property returns a `Scene` that creates a `WindowGroup` containing the `ContentView`.
    /// The `SubscriptionViewModel` is added to the environment so that it is available throughout the application.
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SubscriptionViewModel())
        }
    }
}
