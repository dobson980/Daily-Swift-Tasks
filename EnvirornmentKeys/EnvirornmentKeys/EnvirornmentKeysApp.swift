//
//  EnvirornmentKeysApp.swift
//  EnvirornmentKeys
//
//  Created by Thomas Dobson on 2/23/25.
//

import SwiftUI


// The main entry point for the app. This is where the scene and content view are initialized.
@main
struct EnvirornmentKeysApp: App {
    var body: some Scene {
        // The WindowGroup is the main container for the app’s UI.
        // All views in this group can share environment values.
        WindowGroup {
            // We use ContentView as the root view and set the custom environment key
            // here using the `.dadsKey("dad1234")` modifier.
            ContentView()
                .dadsKey("dad1234")
        }
    }
}
