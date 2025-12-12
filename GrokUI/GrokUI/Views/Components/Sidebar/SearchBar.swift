//
//  SearchBar.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Read-only search bar stub for the sidebar.
///
/// The text is not editable in this demo, but the layout closely matches what
/// a real search field and cancel button would look like in a production app.
struct SearchBar: View {
    /// Shared `enable` flag; when `false` the cancel button is disabled.
    @Binding var enable: Bool

    /// Callback used to close the sidebar from the search area.
    var close: () -> Void = { }
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("Search")
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(height: 40)
            .padding(.horizontal)
            .background(.gray.opacity(0.2), in: .capsule)
            
            Button {
                withAnimation(.spring(duration: 0.2)) {
                    close()
                }
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 40, height: 40)
                    .background(.gray.opacity(0.2), in: .circle)
            }
            .tint(.primary)
            .disabled(!enable)
        }
    }
}

#Preview {
    @Previewable @State var enable: Bool = true
    @Previewable var close: () -> Void = { }
    SearchBar(enable: $enable, close: close)
}
