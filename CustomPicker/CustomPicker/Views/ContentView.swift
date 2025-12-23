//
//  ContentView.swift
//  CustomPicker
//
//  Created by Thomas Dobson on 12/23/25.
//



import SwiftUI

/// Demonstrates a pair of custom time pickers with an inline edit toggle.
/// The row enters an editable state when the pencil is tapped, enabling scroll and exposing the checkmark confirmation.
struct ContentView: View {
    /// Tracks whether pickers should animate open, accept scroll input, and show the checkmark.
    /// Driving this flag to `true` widens spacing, restores opacity to all rows, and re-enables hit-testing in the columns.
   @State private var isEditing = false
    /// Currently selected hour value feeding the left picker column.
    /// Updating this binding also updates the `scrollID` inside the column so the chosen hour remains centered.
   @State private var hour = "20"
    /// Currently selected minute value feeding the right picker column.
    /// Mirrors the same scroll-binding behavior so both columns stay in sync with their displayed selection.
   @State private var minute = "30"

   private let hours = (0...24).map { String(format: "%01d", $0) }
   private let minutes = (0...60).map { String($0) }

   var body: some View {
       TimePickerRow(
           isEditing: $isEditing,
           selectedHour: $hour,
           selectedMinute: $minute,
           hours: hours,
           minutes: minutes
       )
       // Padding keeps the composite control clear of screen edges for readability in previews and the live app.
       // It also leaves room for the shape to expand when edit mode is active without being visually cramped.
       .padding()
   }
}

#Preview {
   ContentView()
}


