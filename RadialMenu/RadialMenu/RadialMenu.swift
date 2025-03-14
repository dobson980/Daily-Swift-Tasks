//
//  RadialMenu.swift
//  RadialMenu
//
//  Created by Thomas Dobson on 3/13/25.
//

import SwiftUI

// RadialMenu is a reusable view that displays a set of menu icons arranged in a radial layout
// around a central toggle button. When the central button is tapped, the menu expands or collapses.
struct RadialMenu: View {
    // A binding variable that controls whether the menu is expanded (true) or collapsed (false).
    @Binding var expanded: Bool
    
    // A computed property that returns the icon size when expanded.
    // When the menu is collapsed, the icons are effectively hidden by being sized very small.
    private var expandedIconSize: Double {
        expanded ? 50 : 1
    }
    
    var body: some View {
        ZStack {
            // Group of menu items arranged in a radial layout using offset and opacity modifiers.
            Group {
                // First icon (e.g., a phone icon)
                Image(systemName: "phone")
                    .font(.system(size: expandedIconSize))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue)
                    // Offset the icon to the left and slightly upward when expanded.
                    .offset(
                        x: expanded ? -100 : 0,
                        y: expanded ? -30 : 0
                    )
                    // Fade in when expanded, fade out when collapsed.
                    .opacity(expanded ? 1 : 0)
                
                // Second icon (e.g., a message icon)
                Image(systemName: "message")
                    .font(.system(size: expandedIconSize))
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.green)
                    // Offset the icon upward when expanded.
                    .offset(
                        x: 0,
                        y: expanded ? -100 : 0
                    )
                    .opacity(expanded ? 1 : 0)
                
                // Third icon (e.g., an envelope icon)
                Image(systemName: "envelope.fill")
                    .font(.system(size: expandedIconSize))
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.red)
                    // Offset the icon to the right and slightly upward when expanded.
                    .offset(
                        x: expanded ? 100 : 0,
                        y: expanded ? -30 : 0
                    )
                    .opacity(expanded ? 1 : 0)
            }
            
            // Central toggle button that controls the expanded state of the radial menu.
            Button {
                // Toggle the expanded state with a linear animation over 0.5 seconds.
                withAnimation(.linear(duration: 0.5)) {
                    expanded.toggle()
                }
            } label: {
                // The button uses a large, colored circle as its appearance.
                Image(systemName: "circle.circle.fill")
                    .font(.system(size: 75))
            }
            // Configure the rendering mode and color style of the central button.
            .symbolRenderingMode(.multicolor)
            .foregroundStyle(.cyan)
        }
    }
}

#Preview {
    // An interactive preview for the RadialMenu using the new @Previewable macro.
    // A local @State variable 'expanded' is used so that the preview can toggle the menu.
    @Previewable @State var expanded = false
    RadialMenu(expanded: $expanded)
}
