//
//  CustomPicker.swift
//  CustomPicker
//
//  Created by Thomas Dobson on 12/23/25.
//

import SwiftUI

/// Scrollable numeric picker column used within the composite time picker.
/// The column only accepts hit-testing in edit mode, and the label stays visible even while the values fade when locked.
/// Visual intent: when locked, the column looks dormant (dimmed rows, tight spacing); when unlocked, all rows fade in and can be dragged.
struct CustomPicker: View {
    /// Whether this column sits on the left; affects corner rounding when locked.
    var isLeft: Bool
    /// Shared edit state; when false, the scroll view ignores input and the non-selected rows fade.
    @Binding var isEditing: Bool
    /// Currently selected value for this column.
    @Binding var selectedValue: String
    /// Data backing the column rows.
    let values: [String]
    /// Short title rendered beside the scroll column.
    let title: String
    /// Tracks which row should be centered; feeds `scrollPosition` and updates the binding on change.
    @State private var scrollID: String?

    var body: some View {
        HStack(spacing: isEditing ? 5 : 0) {
            ZStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: -30) {
                            ForEach(values, id: \.self) { value in
                                Text(value)
                                    .font(.system(size: 25))
                                    .bold()
                                    .frame(height: 63)
                                    .foregroundStyle(selectedValue == value ? Color.primary : .gray)
                                    .id(value)
                                    // When locked, only the active value remains visible; edit mode restores full opacity for smooth scrolling.
                                    // The tiny opacity (0.01) keeps layout stable while making inactive rows effectively invisible.
                                    .opacity(selectedValue == value ? 1 : (isEditing ? 1 : 0.01))
                                    .scrollTransition(axis: .vertical) { effect, phase in
                                        // Shrink items as they move off-center for a focus effect.
                                        // Combined with `scrollTargetLayout`, this emphasizes the centered value during scroll.
                                        effect.scaleEffect(phase.isIdentity ? 1.0 : 0.1)
                                    }
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding(.vertical, 18)
                    .scrollPosition(id: $scrollID, anchor: .center)
                    // Disable gestures until edit mode is active to mimic a locked picker.
                    // This also prevents accidental scroll when the control is meant to be read-only.
                    .allowsHitTesting(isEditing)
                    .onAppear {
                        scrollID = selectedValue
                        // Ensure initial centering once the view hierarchy is laid out.
                        // Using the async hop avoids scrolling before the layout knows its size.
                        DispatchQueue.main.async {
                            proxy.scrollTo(selectedValue, anchor: .center)
                        }
                    }
                    .onChange(of: scrollID) { _, newID in
                        // Keep the external binding in sync whenever the scroll view settles on a new value.
                        // This is triggered both by user scrolls and by programmatic updates to `scrollID`.
                        if let newID {
                            selectedValue = newID
                        }
                    }
                }
            }
            .frame(width: 40, height: 100)

            Text(title)
                .font(.system(size: 25))
                .bold()
                .foregroundStyle(.gray)
        }
        .padding(.trailing, 3)
        .padding(isEditing ? .horizontal : .leading, 10)
        .frame(height: isEditing ? 105 : 60)
        .clipped()
        // Shape responds to edit state and left/right role to preserve a continuous capsule when the pair is locked.
        // In edit mode every corner rounds out so each column reads as its own pill; when locked, inner edges flatten to merge with neighbors.
        .background(.BG.tertiary, in: pickerShape(isEditing: isEditing, isLeft: isLeft))
    }
}

#Preview("Picker — editable") {
    StatefulPreviewWrapper2(true, "5") { isEditing, value in
        CustomPicker(
            isLeft: true,
            isEditing: isEditing,
            selectedValue: value,
            values: (0...9).map(String.init),
            title: "Hr"
        )
        .padding()
        .background(Color(.systemBackground))
    }
}

#Preview("Picker — read only") {
    StatefulPreviewWrapper2(false, "30") { isEditing, value in
        CustomPicker(
            isLeft: false,
            isEditing: isEditing,
            selectedValue: value,
            values: stride(from: 0, through: 55, by: 5).map(String.init),
            title: "Min"
        )
        .padding()
        .background(Color(.systemBackground))
    }
}

private func pickerShape(isEditing: Bool, isLeft: Bool) -> UnevenRoundedRectangle {
    if isEditing {
        return UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: 12,
            bottomTrailingRadius: 12,
            topTrailingRadius: 12
        )
    }

    if isLeft {
        return UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: 12,
            bottomTrailingRadius: 0,
            topTrailingRadius: 0
        )
    }

    return UnevenRoundedRectangle(
        topLeadingRadius: 0,
        bottomLeadingRadius: 0,
        bottomTrailingRadius: 0,
        topTrailingRadius: 0
    )
}
