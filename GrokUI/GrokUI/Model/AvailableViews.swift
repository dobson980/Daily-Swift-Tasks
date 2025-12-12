//
//  AvailableViews.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

/// Simple routing enum for the main content area.
///
/// `ContentView` uses this to decide which top-level screen should be visible
/// next to the sidebar (profile, settings, notifications, or the chat view).
enum AvailableViews {
    case profile, settings, notifications, chat
}
