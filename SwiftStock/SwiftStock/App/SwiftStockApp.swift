//
//  SwiftStockApp.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/24/25.
//

import SwiftUI

/**
 The entry point of the SwiftStock application.
 
 This structure conforms to the `App` protocol, which sets up the main scene of the application.
 It provides a root view (`ContentView`) and injects the `StockViewModel` into the environment so that
 descendant views may access shared state.
 */
@main
struct SwiftStockApp: App {
    
    /// The main scene of the app that contains the application's user interface.
    var body: some Scene {
        WindowGroup {
            // The starting view of the application, receiving an instance of `StockViewModel`.
            ContentView()
                .environmentObject(StockViewModel())
        }
    }
}
