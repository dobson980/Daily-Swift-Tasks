//
//  ContentView.swift
//  EnvirornmentKeys
//
//  Created by Thomas Dobson on 2/23/25.
//

import SwiftUI

// ContentView is the main view where we demonstrate using the custom environment key.
struct ContentView: View {
    // Here we use the @Environment property wrapper to read the value of `dadsKey`.
    // This will grab the value from the environment (set by a parent view or the default value).
    @Environment(\.dadsKey) var dadsKey: String

    // The body of the ContentView is a simple VStack that displays some text
    // and an icon. We use the value of `dadsKey` to show it in the Text view.
    var body: some View {
        VStack {
            // A globe image, which is just a placeholder for some UI content.
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()

            // This Text view displays the current value of `dadsKey`.
            Text("Dads Key: \(dadsKey)")
        }
        .padding() // Adds some space around the VStack for a nicer appearance.
    }
}

#Preview {
    ContentView()
}
