//
//  ContentView.swift
//  RadialMenu
//
//  Created by Thomas Dobson on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    var body: some View {
        VStack {
            RadialMenu(expanded: $isExpanded)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
