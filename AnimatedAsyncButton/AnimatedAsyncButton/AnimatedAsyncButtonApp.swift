//
//  AnimatedAsyncButtonApp.swift
//  AnimatedAsyncButton
//
//  Created by Thomas Dobson on 4/2/25.
//

import SwiftUI

/// The main entry point of the AnimatedAsyncButton application.
/// 
/// This structure conforms to the App protocol and sets up the main scene for the app.
/// It is responsible for loading the initial view encapsulated within the WindowGroup.
@main
struct AnimatedAsyncButtonApp: App {
    /// The body of the application.
    ///
    /// A WindowGroup scene that displays the ContentView when the application launches.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
