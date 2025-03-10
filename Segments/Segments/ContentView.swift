//
//  ContentView.swift
//  Segments
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

// This is the main view of your app that displays the current selected segment's title
// and includes the custom segmented control at the bottom.
struct ContentView: View {
    // A state variable to keep track of which segment is currently selected.
    // This state is local to ContentView and is updated by the segmented control.
    @State private var selectedSegment: Segments = .First

    var body: some View {
        // A vertical stack that arranges views from top to bottom.
        VStack {
            // Spacer pushes the content toward the center vertically.
            Spacer()
            
            // Displays the title of the currently selected segment.
            // It reads the title from the 'selectedSegment' enum case.
            Text("\(selectedSegment.title) segment has been selected")
            
            // Another Spacer to center the text vertically on the screen.
            Spacer()
            
            // The custom segmented control, which takes a binding to selectedSegment.
            // This allows the control to update the state in ContentView.
            SegmentControl(selectedSegment: $selectedSegment)
        }
        // Add padding around the VStack to ensure content doesn't touch the screen edges.
        .padding()
    }
}

#Preview {
    ContentView()
}
