//
//  SegmentSwiperApp.swift
//  SegmentSwiper
//
//  Created by Thomas Dobson on 4\/2\/25.
//
//  This file defines the main entry point of the SegmentSwiper application.
//  It uses SwiftUI and marks the application’s execution entry through the
//  @main attribute, configuring the main scene via a WindowGroup that hosts
//  the ContentView.

import SwiftUI

/// The main entry point for the SegmentSwiper application.
///
/// The `SegmentSwiperApp` struct conforms to the `App` protocol and serves as
/// the application's root. It defines the primary scene that contains the main
/// user interface. The scene is created using a `WindowGroup`, which provides
/// the environment for the user interface elements to be displayed.
@main
struct SegmentSwiperApp: App {
    
    /// The main user interface scene of the application.
    ///
    /// This computed property defines the scene upon which the application’s
    /// user interface is built. The `WindowGroup` encapsulates the `ContentView`
    /// as the starting view, ensuring that it adapts to different window configurations.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
