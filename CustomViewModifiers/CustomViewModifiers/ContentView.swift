//
//  ContentView.swift
//  CustomViewModifiers
//
//  Created by Thomas Dobson on 2/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Dad Style!!")
                .dadsStyle()
        }
        .padding()
    }
}

struct DadsStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(style: StrokeStyle(lineWidth: 3))
            )
    }
}

extension View {
    public func dadsStyle() -> some View {
        modifier(DadsStyle())
    }
}

#Preview {
    ContentView()
}
