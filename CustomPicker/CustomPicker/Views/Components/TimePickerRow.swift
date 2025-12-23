//
//  TimePickerRow.swift
//  CustomPicker
//
//  Created by GitHub Copilot on 12/23/25.
//

import SwiftUI

/// Horizontal container that couples two numeric picker columns with an animated edit toggle.
/// When `isEditing` flips to true, spacing opens up, hit-testing is enabled on both pickers, and the checkmark becomes visible.
/// This view is intentionally thin: it only coordinates layout and propagates the shared edit state so each child can react.
struct TimePickerRow: View {
    /// Shared edit mode binding that drives spacing, interactivity, and toggle visuals.
    @Binding var isEditing: Bool
    /// Selected hour passed down to the left picker.
    @Binding var selectedHour: String
    /// Selected minute passed down to the right picker.
    @Binding var selectedMinute: String
    /// Source values for hours.
    let hours: [String]
    /// Source values for minutes.
    let minutes: [String]

    var body: some View {
        HStack(spacing: isEditing ? 20 : 0) {
            // Left column renders hour values and rounds the outer edge when not editing.
            // In locked mode the right edges flatten so both columns and the toggle form a single capsule.
            CustomPicker(
                isLeft: true,
                isEditing: $isEditing,
                selectedValue: $selectedHour,
                values: hours,
                title: "Hr"
            )

            // Right column renders minute values and squares off until edit mode is active.
            // When unlocked, both columns gain fully rounded corners to read as independent controls.
            CustomPicker(
                isLeft: false,
                isEditing: $isEditing,
                selectedValue: $selectedMinute,
                values: minutes,
                title: "Min"
            )

            // Trailing control toggles edit mode, animating shape and icon.
            // Its height also expands to match the pickers so the trio stays visually aligned during interaction.
            EditToggleButton(isEditing: $isEditing)
        }
    }
}

#Preview("Time picker row") {
    StatefulPreviewWrapper3(false, "08", "15") { isEditing, hour, minute in
        TimePickerRow(
            isEditing: isEditing,
            selectedHour: hour,
            selectedMinute: minute,
            hours: (0...23).map { String(format: "%02d", $0) },
            minutes: (0...59).map { String(format: "%02d", $0) }
        )
        .padding()
        .background(Color(.systemBackground))
    }
}
