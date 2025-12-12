//
//  SideBarNavigationActions.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// List of primary navigation destinations in the sidebar.
///
/// Tapping any of these buttons updates the `currentView` binding, which in
/// turn causes `ContentView` to swap the visible main screen.
struct SideBarNavigationActions: View {
    
    /// Bound routing state shared with the parent container.
    @Binding var currentView: AvailableViews
    
    var body: some View {
        Text("Navigate")
            .foregroundColor(.gray)
        
        VStack(alignment: .leading, spacing: 24) {
            SideViewButton(text: "Chat") {
                currentView = .chat
            }
            SideViewButton(text: "Notifications") {
                currentView = .notifications
            }
            SideViewButton(text: "Profile") {
                currentView = .profile
            }
        }
        .tint(.primary)
    }
}

#Preview {
    @Previewable @State var view: AvailableViews = .chat
    SideBarNavigationActions(currentView: $view)
}
