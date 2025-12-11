//
//  NavigationManager.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Central object that owns the navigation state for the app.
///
/// Marked `@Observable` so SwiftUI can automatically watch the `path`
/// and update any `NavigationStack` that binds to it.
@Observable
class NavigationManager {
    /// Shared singleton instance used by all views in this small demo.
    ///
    /// In a larger app you might inject this instead of using a global,
    /// but for a focused example the singleton keeps setup simple.
    static let shared = NavigationManager()
    private init() {}
    
    /// The typed navigation path driving the `NavigationStack`.
    var path = NavigationPath()
    
    /// Push the orange page onto the navigation stack.
    func goToOrangePage() {
        path.append(NavigationPage.orangePage)
    }
    
    /// Push the red page onto the navigation stack.
    func goToRedPage() {
        path.append(NavigationPage.redPage)
    }
    
    /// Clear the entire stack and return to the root view.
    func popToRoot() {
        path = NavigationPath()
    }
}
