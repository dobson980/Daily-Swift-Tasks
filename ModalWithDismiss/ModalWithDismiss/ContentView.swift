//
//  ContentView.swift
//  ModalWithDismiss
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

// The main content view that displays a question and a button to present a modal.
struct ContentView: View {
    // State variable to track whether the modal is presented.
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            // Displays a question styled with a gradient foreground.
            Text("Would you like to learn more about SwiftUI?")
                .font(.system(size: 40))
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    Gradient(colors: [.blue, .purple])
                )
            Spacer()
            // A button that toggles the modal presentation state.
            Button {
                isPresented.toggle()
            } label: {
                Text("Learn More")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        // Presents a modal view when `isPresented` is true.
        .sheet(isPresented: $isPresented) {
            ModalView()
        }
    }
}

// A preview to show the ContentView in Xcode’s canvas.
#Preview {
    ContentView()
}
