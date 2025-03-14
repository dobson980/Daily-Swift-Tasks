//
//  ContentView.swift
//  BottomSheet
//
//  Created by Thomas Dobson on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    // State variable that tracks whether the bottom sheet (info pane) is shown.
    @State private var showInfoPane: Bool = false
    
    var body: some View {
        // ZStack layers views on top of each other.
        // The bottom sheet is placed behind the main content.
        ZStack {
            // Main content area with a button to toggle the bottom sheet.
            VStack {
                // Button that toggles the bottom sheet's visibility.
                Button {
                    // Animate the state change over 0.5 seconds for a smooth transition.
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showInfoPane.toggle()
                    }
                } label: {
                    // The button's visual content: an icon and text arranged vertically.
                    VStack {
                        // Display an info icon.
                        Image(systemName: "info.circle")
                            .font(.system(size: 40))
                        // Display button label text.
                        Text("Show More Info")
                    }
                }
            }
            .padding()  // Add padding around the button to prevent it from touching the screen edges.
            
            // The BottomSheet view is layered behind the button.
            // Its visibility is controlled by the binding to showInfoPane.
            BottomSheet(isPresented: $showInfoPane)
        }
    }
}

#Preview {
    ContentView()
}
