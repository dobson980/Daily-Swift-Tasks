//  ContentView.swift
//  SwiftMenus
//
//  Created by Thomas Dobson on 3/18/25.
//
//  This file contains the ContentView structure, a SwiftUI view that demonstrates
//  the use of toolbars and menus. It displays a title with a gradient,
//  a descriptive text, and a toolbar button that presents a menu with various actions
//  and settings.

import SwiftUI

/// The main SwiftUI view for the SwiftMenus demo application.
/// This view uses a NavigationView to wrap its content and includes a vertically arranged
/// stack of text elements to display a title and a description. A toolbar item is provided
/// that displays a menu with two sections: one for actions and one for settings.
struct ContentView: View {
    var body: some View {
        // NavigationView creates a context for navigation-based interfaces.
        NavigationView {
            // VStack arranges child views (title and description) vertically.
            VStack {
                // Title text with a large font size and a linear gradient style.
                Text("Menu Mayhem!")
                    .font(.system(size: 50))
                    .foregroundStyle(
                        .linearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
                    )
                // Informational text prompting the user to interact with the menu.
                Text("Open the menu in the top right to explore that kinds of layout you can make with SwiftUI Menus")
            }
            // Adds a 35-point padding around the VStack content to provide sufficient spacing.
            .padding(35)
            // Toolbar provides a customizable area for embedding interactive controls.
            .toolbar {
                // ToolbarItem wraps the menu to be displayed on the toolbar.
                ToolbarItem {
                    // The Menu component organizes buttons under different sections.
                    Menu {
                        // First section grouping action-related buttons.
                        Section("Actions") {
                            // Button for the "Copy" action.
                            Button("Copy", action: {})
                            // Button for the "Paste" action.
                            Button("Paste", action: {})
                            // Button for the "Cut" action.
                            Button("Cut", action: {})
                            // Button for the "Delete" action, marked as destructive.
                            Button("Delete", role: .destructive, action: {})
                        }
                        // Second section grouping settings-related buttons.
                        Section("Settings") {
                            // Button to open Preferences.
                            Button("Preferences", action: {})
                            // Button to show Account information.
                            Button("Account", action: {})
                            // Button to perform Logout.
                            Button("Logout", action: {})
                            // Nested Menu for Help, offering further sub-actions.
                            Menu("Help") {
                                // Button for "FAQ" section.
                                Button("FAQ", action: {})
                                // Button for "Contact" section.
                                Button("Contact", action: {})
                            }
                        }
                    } label: {
                        // Label for the menu button, combining text and a system image.
                        Label("Main Menu", systemImage: "line.horizontal.3")
                    }
                    // Specifies that the menu items should remain in fixed order.
                    .menuOrder(.fixed)
                }
            }
        }
    }
}

/// A preview provider structure for displaying ContentView in Xcode’s canvas and previews.
#Preview {
    ContentView()
}
