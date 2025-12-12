//
//  ActionButton.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Small reusable pill-style button used in the horizontal action bar.
///
/// The intent is to make it easy to add new quick actions by just providing a
/// system icon name and label.
struct ActionButton: View {
    
    /// SF Symbol name for the leading icon (for example, "waveform").
    var icon: String

    /// Short descriptive label shown under the icon.
    var label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon)
                .font(Font.system(size: 20, weight: .medium))
                .foregroundStyle(.gray)
            Text(label)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .frame(height: 90)
        .background(.gray.opacity(0.3),in: .rect(cornerRadius: 16))
        
    }
}

#Preview {
    ActionButton(icon: "clock", label: "Clock")
}
