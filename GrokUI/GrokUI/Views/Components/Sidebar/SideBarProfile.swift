//
//  SideBarProfile.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Compact profile footer at the bottom of the sidebar.
///
/// This mirrors the "account switcher" / settings affordance seen in many
/// productivity apps.
struct SideBarProfile: View {
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Circle()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white.opacity(0.2))
                    .overlay(Image(systemName: "cube"))
                Text("Tom Dobson")
            }
            Spacer()
            Image(systemName: "gear")
            
        }
        .padding()
    }
}

#Preview {
    SideBarProfile()
}
