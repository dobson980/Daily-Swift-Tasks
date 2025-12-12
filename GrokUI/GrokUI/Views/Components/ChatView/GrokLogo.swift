//
//  GrokLogo.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/12/25.
//

import SwiftUI

/// Centered logo used as a subtle background element on the chat screen.
///
/// The logo is offset upward so it floats above the input container that hugs
/// the bottom of the screen.
struct GrokLogo: View {
    var body: some View {
        Image("Grok").resizable().scaledToFill()
            .frame(width: 100, height: 100)
            .foregroundStyle(.gray)
            .offset(y: -80)
    }
}

#Preview {
    GrokLogo()
}
