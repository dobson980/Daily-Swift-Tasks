//
//  ColoredGlassButton.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Reusable "glass"-styled button that can be tinted with a custom color.
///
/// This wraps SwiftUI's built-in glass button styles and exposes them
/// through a simple `GlassButtonStyle` enum so the rest of the app
/// doesn't have to worry about the specific button style values.
struct ColoredGlassButton: View {
    /// Text shown inside the button.
    var title: String
    /// Tint used for the button foreground / accent color.
    var color: Color
    /// High-level style describing how "glassy" the button should look.
    var glassStyle: GlassButtonStyle
    /// Closure executed when the button is tapped.
    var action: () -> Void
    
    init(title: String,
         color: Color,
         glassStyle: GlassButtonStyle = .glassProminent,
         action: @escaping () -> Void
    ){
        self.title = title
        self.color = color
        self.glassStyle = glassStyle
        self.action = action
    }
    
    var body: some View {
        Button(title) {
            // Delegate the tap handling so the caller decides what
            // navigation or business logic should happen.
            action()
        }
        // Apply the chosen glass style using the helper below.
        .applyGlassStyle(glassStyle)
        // Use the provided color as the main accent / tint.
        .tint(color)
        // Make the button feel more prominent in the UI.
        .controlSize(.large)
    }
}

extension View {
    /// Convenience helper that maps a `GlassButtonStyle` value onto the
    /// appropriate system button style.
    @ViewBuilder
    func applyGlassStyle(_ style: GlassButtonStyle) -> some View {
        switch style {
        case .none:
            self
        case .glass:
            self.buttonStyle(.glass)
        case .glassProminent:
            self.buttonStyle(.glassProminent)
        }
    }
}

#Preview {
    ColoredGlassButton(title: "Green", color: .green) {
        
    }
    
    ColoredGlassButton(title: "Purple", color: .purple, glassStyle: .glass) {
        
    }
}
