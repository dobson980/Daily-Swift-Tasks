//
//  EditToggleButton.swift
//  CustomPicker
//
//  Created by GitHub Copilot on 12/23/25.
//

import SwiftUI

/// Taps to enter edit mode and animates between pencil and checkmark states.
/// The surrounding shape grows to match the picker height in edit mode so the trio forms a unified control.
/// Visual narrative: pencil implies locked/read-only; checkmark implies confirmation. Both move with directional offsets to show state change.
struct EditToggleButton: View {
    /// Shared edit binding used to flip icon, height, and corner rounding.
    @Binding var isEditing: Bool

    var body: some View {
        ZStack {
            if isEditing {
                Image(systemName: "checkmark")
                    .font(.system(size: 25))
                    .bold()
                    // Slides the checkmark in from the left while blurring the outgoing pencil.
                    .transition(.blurReplace.combined(with: .offset(x: -35)))
            } else {
                Image(.pen)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.primary)
                    .frame(width: 20, height: 20)
                    // Slides the pencil in from the right when leaving edit mode.
                    .transition(.blurReplace.combined(with: .offset(x: 35)))
            }
        }
        .padding(.horizontal, 20)
        .frame(height: isEditing ? 105 : 60)
        .background(
            .BG.tertiary,
            in: UnevenRoundedRectangle(
                topLeadingRadius: isEditing ? 12 : 0,
                bottomLeadingRadius: isEditing ? 12 : 0,
                bottomTrailingRadius: 12,
                topTrailingRadius: 12
            )
        )
        .onTapGesture {
            // Toggle edit mode with a softer spring when entering, and a gentler animation when exiting.
            withAnimation(!isEditing ? .smooth(duration: 0.5, extraBounce: 0.5) : .smooth) {
                isEditing.toggle()
            }
        }
    }
}

#Preview("Toggle button") {
    StatefulPreviewWrapper(false) { isEditing in
        EditToggleButton(isEditing: isEditing)
            .padding()
            .background(Color(.systemBackground))
    }
}
