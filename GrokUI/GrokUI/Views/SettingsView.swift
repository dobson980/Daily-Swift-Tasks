//
//  SettingsView.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Simple settings placeholder used as another target for sidebar navigation.
///
/// This keeps routing logic realistic without distracting from the core
/// interaction pattern of the sliding menu and chat surface.
struct SettingsView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Text("This is the Settings View")
                .font(.title)
                .foregroundColor(.green)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
     
    }
}

#Preview {
    SettingsView()
}
