//
//  ActionButtonBar.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Horizontally scrolling row of quick actions shown above the chat input.
///
/// Each `ActionButton` is a small, tappable summary of a feature the model
/// could trigger (voice mode, image generation, etc.).
struct ActionButtonBar: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ActionButton(icon: "waveform", label: "Voice Mode")
                ActionButton(icon: "sparkles.rectangle.stack", label: "Create Images")
                ActionButton(icon: "camera", label: "Open Camera")
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ActionButtonBar()
}
