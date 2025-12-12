//
//  ChatField.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Simple text field for entering prompts.
///
/// In this demo the text binding is constant (read-only) because the focus is
/// on layout; in a real app you would pass a `@Binding<String>` from above.
struct ChatField: View {
    
   /// Local focus state so previews can show the keyboard behavior in
   /// isolation if needed.
   @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("Ask Anything", text: .constant(""))
            .tint(.white)
            .focused($isFocused)
    }
}

#Preview {
    ChatField()
}
