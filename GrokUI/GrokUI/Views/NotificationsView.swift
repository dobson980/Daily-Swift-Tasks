//
//  NotificationView.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Placeholder screen for the notifications tab.
///
/// In a full app this would list recent alerts; here it mainly demonstrates how
/// the sidebar can swap between multiple top-level destinations.
struct NotificationsView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Text("This is the Notifications View")
                .font(.title)
                .foregroundColor(.orange)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
      
    }
}

#Preview {
    NotificationsView()
}
