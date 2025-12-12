//
//  ConversationItem.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Single row in the conversation history list.
///
/// Keeping this view small and self-contained makes it easy to reuse in other
/// lists or swap in real data later.
struct ConversationItem: View {
    
    /// Display title for the conversation (for example, the first user prompt).
    var title: String

    /// A simple date string to show when the chat happened.
    var date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.body)
            Text(date)
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

#Preview {
    ConversationItem(title: "SwiftUI", date: "12/10/25")
}
