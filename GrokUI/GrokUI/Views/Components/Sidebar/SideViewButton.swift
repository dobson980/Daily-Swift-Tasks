//
//  SideViewButton.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

struct SideViewButton: View {
    
    /// Simple text-only button used for navigation rows in the sidebar.
    ///
    /// Extracting this into its own view makes it easy to tweak styling for all
    /// navigation items in one place.
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
    }
}

#Preview {
    @Previewable @State var view: AvailableViews = .chat
    SideViewButton(text: "Chat") {}
}
