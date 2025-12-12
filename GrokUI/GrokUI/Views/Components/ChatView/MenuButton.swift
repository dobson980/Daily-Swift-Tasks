//
//  MenuButton.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Hamburger-style button used to open the sidebar from the chat view.
///
/// It reacts to the shared `enable` flag so the parent can temporarily disable
/// the control during drag gestures or other transient states.
struct MenuButton: View {
    
    /// When `false` the button is visually dimmed and not tappable.
    @Binding var enable: Bool

    /// Focus binding for the chat text field; the button clears focus so the
    /// keyboard dismisses when the menu is opened.
    @FocusState var isFocused: Bool

    /// Called when the user taps the button.
    var open: () -> Void
    
    var body: some View {
        Button {
            withAnimation(.spring(duration: 0.2)) {
                open()
                isFocused = false
            }
        } label: {
            ZStack {
                Image(systemName: "line.3.horizontal.decrease")
                    .foregroundStyle(enable ? .white : .secondary)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 30, height: 30)
                    .tint(enable ? .secondary : .primary)
            }
        }
        .disabled(!enable)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        HStack {
            MenuButton(enable: .constant(true)) { }
            MenuButton(enable: .constant(false)) { }
        }
        
    }
}
