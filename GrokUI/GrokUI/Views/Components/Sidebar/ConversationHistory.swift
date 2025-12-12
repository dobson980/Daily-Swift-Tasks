//
//  Conversations.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Small section that lists a few hard-coded past conversations.
///
/// The goal is to hint at how a real sidebar might show recents without
/// pulling in persistence or networking for this demo.
struct ConversationHistory: View {
    var body: some View {
        
        Text("Conversations")
            .foregroundColor(.gray)
            .padding(.top, 16)
        
        VStack(alignment: .leading, spacing: 12) {
            ConversationItem(title: "Learn SwiftUI", date: "12/10/2025")
            ConversationItem(title: "UIKit is Out", date: "01/15/2022")
        }
    
    }
}

#Preview {
    ConversationHistory()
}
