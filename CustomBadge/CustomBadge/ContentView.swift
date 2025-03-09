//
//  ContentView.swift
//  CustomBadge
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

// The main content view that displays a text label and a badge.
struct ContentView: View {
    var body: some View {
        VStack {
            // A horizontal stack containing the label and the badge.
            HStack {
                // A label styled with a bold, large font.
                Text("Here is a custom badge")
                    .font(.system(size: 30, weight: .bold))
                // The badge view, positioned near the label.
                BadgeView(badgeCount: 8)
                    .offset(x: -15, y: -20) // Adjusts the position of the badge.
            }
        }
        // Adds padding around the entire VStack.
        .padding()
    }
}

// A preview provider for the ContentView.
#Preview {
    ContentView()
}
