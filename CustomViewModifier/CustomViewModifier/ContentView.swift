//
//  ContentView.swift
//  CustomViewModifier
//
//  Created by Thomas Dobson on 3/3/25.
//

import SwiftUI

// The main view that demonstrates the use of custom ViewModifiers.
struct ContentView: View {
    var body: some View {
        VStack {
            // A spacer to add flexible vertical space before the first text.
            Spacer()
            
            // This text uses the convenience method to apply the BigAndBlueText modifier.
            Text("This is an example of a custom view called with the convenience method")
                .bigAndBlueText()
            
            // A spacer to separate the two text views.
            Spacer()
            
            // This text applies the BigAndRedText modifier directly without a convenience method.
            Text("This is an example of a custom view called without a convenience method")
                .modifier(BigAndRedText())
            
            // A spacer to add flexible vertical space after the second text.
            Spacer()
        }
        .padding() // Adds padding around the entire VStack.
    }
}

// A custom ViewModifier that makes the text large and blue.
struct BigAndBlueText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle) // Makes the text large.
            .foregroundColor(.blue) // Changes the text color to blue.
    }
}

// A custom ViewModifier that makes the text large and red.
struct BigAndRedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle) // Makes the text large.
            .foregroundColor(.red) // Changes the text color to red.
    }
}

// An extension on View that provides a convenience method for the BigAndBlueText modifier.
extension View {
    public func bigAndBlueText() -> some View {
        modifier(BigAndBlueText())
    }
}

// A preview provider to show the ContentView in Xcode’s preview canvas.
#Preview {
    ContentView()
}
