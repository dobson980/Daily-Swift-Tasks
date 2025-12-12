//
//  ActionToolBar.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Accessory toolbar that sits next to the chat text field.
///
/// This bar mimics controls you might see in a real AI chat client: attach
/// files, switch models, toggle ideas, or start a voice interaction.
struct ActionToolBar: View {
    
    var body: some View {
        HStack(spacing: 10) {
            // Attachment button.
            Image(systemName: "paperclip")
                .foregroundStyle(.gray)
                .padding(10)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 42))
            
            // Model picker pill (labelled "Grok 3" in this demo).
            HStack {
                Image(systemName: "line.3.crossed.swirl.circle.fill")
                    .foregroundColor(.gray)
                
                Text("Grok 3")
                
                Image(systemName: "chevron.down")
            }
            .padding(10)
            .foregroundStyle(.white)
            .background(.gray.opacity(0.3), in: .rect(cornerRadius: 8))
            
            // Idea / suggestions icon.
            Image(systemName: "lightbulb")
                .foregroundStyle(.gray)
            
            // Voice input button pinned to the trailing edge.
            HStack(spacing: 6) {
                Image(systemName: "waveform")
                Text("Speak").fontWeight(.medium)
            }
            .font(.system(size: 18))
            .padding(.horizontal, 14).padding(.vertical, 8)
            .background(.white,in:.rect(cornerRadius: 20))
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity,alignment: .trailing)
        }
    }
}

#Preview {
    ActionToolBar()
}
