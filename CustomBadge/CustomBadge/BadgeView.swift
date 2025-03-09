//
//  BadgeView.swift
//  CustomBadge
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

// A reusable badge view that displays a count inside a rounded rectangle.
struct BadgeView: View {
    // The integer count to display in the badge.
    var badgeCount: Int
    
    var body: some View {
        VStack {
            // A horizontal stack for alignment (can be expanded if needed).
            HStack {
                // A ZStack to overlay the number on top of a colored, rounded rectangle.
                ZStack {
                    // A rounded rectangle with a blue fill and gray stroke border.
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 4) // Adds a gray border.
                        .fill(.blue) // Fills the shape with blue.
                        .frame(width: 25, height: 25) // Sets the badge size.
                        .foregroundColor(.blue) // Sets the foreground color to blue.
                    // The badge count text, displayed on top of the rounded rectangle.
                    Text("\(badgeCount)")
                        .foregroundStyle(.white) // Sets the text color to white.
                }
            }
        }
    }
}

// A preview provider for the BadgeView.
#Preview {
    BadgeView(badgeCount: 4)
}
