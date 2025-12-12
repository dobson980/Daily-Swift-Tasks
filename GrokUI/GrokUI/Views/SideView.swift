//
//  SideView.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Left-hand sidebar that mimics the navigation column of AI chat apps.
///
/// This view composes several smaller components:
/// - A search bar for quickly jumping between conversations.
/// - Quick actions (new chat, settings, etc.).
/// - Navigation buttons that update `currentView`.
/// - A simple conversation history list and profile footer.
struct SideView: View {
    
    /// Binding into the parent so taps here can swap the main content view.
    @Binding var currentView: AvailableViews

    /// Shared "enable" flag used to coordinate interactions with the chat
    /// surface (for example, disabling the push-to-talk button while dragging).
    @Binding var enable: Bool

    /// Called when the sidebar wants to close itself (for example, from the
    /// search bar cancel action).
    var close: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                SearchBar(enable: $enable, close: close)
                
                SideViewQuickActions()
                
                SideBarNavigationActions(currentView: $currentView)
                
                ConversationHistory()
                
                Spacer()
                
                SideBarProfile()
            }
            .padding(.top, 32)
            .padding(.horizontal)
        }
    }
}

#Preview {
    SideView(currentView: .constant(.chat), enable: .constant(false), close: {})
}
