//
//  SideViewQuickActions.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Quick access links shown near the top of the sidebar.
///
/// These are non-interactive in this demo but provide realistic structure for
/// learners to plug in their own navigation later.
struct SideViewQuickActions: View {
    var body: some View {
        Text("Quick Action")
            .foregroundColor(.gray)
        
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "square.and.pencil")
                Text("New Conversation")
            }
            
            HStack(spacing: 12) {
                Image(systemName: "clock")
                Text("Tasks")
            }
        }
    }
}

#Preview {
    SideViewQuickActions()
}
