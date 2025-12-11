//
//  ContentView.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Home screen for the **SwiftNav** demo.
///
/// Shows two buttons that push different colored destination pages using
/// a shared `NavigationManager` and a typed `NavigationStack` path.
struct ContentView: View {
    /// Local state reference to the shared navigation manager.
    ///
    /// Using `@State` with an `@Observable` class allows SwiftUI to
    /// subscribe to changes and keep the navigation stack in sync.
    @State var nav = NavigationManager.shared
    
    var body: some View {
        // The stack binds directly to the manager's `path`, so calling
        // methods like `goToRedPage()` will update the navigation.
        NavigationStack(path: $nav.path) {
            VStack(spacing: 20) {
    
                // Tapping this button appends `.redPage` to the path.
                ColoredGlassButton(title: "Red", color: .red) {
                    nav.goToRedPage()
                }
                
                // Tapping this button appends `.orangePage` to the path.
                ColoredGlassButton(title: "Orange", color: .orange) {
                    nav.goToOrangePage()
                }
            }
            .navigationTitle("Home")
            // Define how each `NavigationPage` value maps to a concrete view.
            .navigationDestination(for: NavigationPage.self) { page in
                switch page {
                case .orangePage:
                    ColoredPage(backgroundColor: .orange,
                                buttonText: "Return",
                                buttonColor: .orange
                    ) {
                        // From the orange page, jump back to the root.
                        nav.popToRoot()
                    }
                case .redPage:
                    ColoredPage(backgroundColor: .red,
                                buttonText: "Return",
                                buttonColor: .red
                    ) {
                        // From the red page, jump back to the root.
                        nav.popToRoot()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
