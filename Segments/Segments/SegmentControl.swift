//
//  SegmentControl.swift
//  Segments
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

// This view defines a custom segmented control.
// It uses a binding to a Segments enum so that when a segment is tapped,
// it updates the selected segment in the parent view.
struct SegmentControl: View {
    // Binding allows two-way data flow between this view and its parent.
    // When a segment is tapped, it updates the parent's state.
    @Binding var selectedSegment: Segments
    
    var body: some View {
        // An HStack lays out the segments horizontally.
        HStack {
            // Iterate over all cases in the Segments enum.
            // The id: \.self tells SwiftUI that each segment is uniquely identified by itself.
            ForEach(Segments.allCases, id: \.self) { segment in
                // Create a button for each segment.
                Button {
                    // When the button is tapped, print a message to the console.
                    print("\(segment.title) button tapped.")
                    
                    // Animate the transition when changing the selected segment.
                    withAnimation {
                        selectedSegment = segment
                    }
                } label: {
                    // Display the title of the segment on the button.
                    Text(segment.title)
                }
                // Apply a prominent button style for a clearer, system-style look.
                .buttonStyle(.borderedProminent)
                // Change the tint based on whether this segment is selected.
                // If it's selected, the tint is not changed (using .none),
                // otherwise, it appears gray.
                .tint(segment == selectedSegment ? .none : .gray)
            }
        }
    }
}

// Enum defining the different segments available in the control.
// Conforming to CaseIterable allows iteration over all cases using allCases.
enum Segments: CaseIterable {
    case First
    case Second
    case Third
    
    // A computed property to return a user-friendly title for each segment.
    var title: String {
        switch self {
        case .First:
            return "First"
        case .Second:
            return "Second"
        case .Third:
            return "Third"
        }
    }
}

#Preview {
    // Declare a state variable for the selected segment, and use @Previewable for interactiveness in iOS 18 previews
    @Previewable @State var selectedSegment: Segments = .First

    // Use the custom segment control, passing the selected segment state as a binding
    SegmentControl(selectedSegment: $selectedSegment)
}
