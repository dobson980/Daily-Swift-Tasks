//
//  ContentView.swift
//  SideBar
//
//  Created by Thomas Dobson on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    // A state variable to track whether the sidebar is visible.
    // When this value is true, the sidebar will slide in; when false, it will slide out.
    @State private var showSidebar = false

    var body: some View {
        // ZStack layers views on top of each other.
        // Here, the sidebar is placed behind the main content.
        ZStack {
            // The custom sidebar view, which receives a binding to 'showSidebar'.
            // This allows the sidebar to update its position based on the parent's state.
            CustomSideBar(isPresented: $showSidebar)
            
            // The main content of the view, placed on top of the sidebar.
            VStack {
                // A button that toggles the visibility of the sidebar.
                // Tapping this button updates the 'showSidebar' state variable.
                Button("Open Sidebar") {
                    showSidebar.toggle() // Toggle the sidebar's visibility.
                }
            }
            .padding() // Add padding around the main content.
        }
    }
}

#Preview {
    // The preview provider to display ContentView in Xcode's canvas.
    ContentView()
}
