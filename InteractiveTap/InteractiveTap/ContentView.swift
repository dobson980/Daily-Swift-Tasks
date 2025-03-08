//
//  ContentView.swift
//  InteractiveTap
//
//  Created by Thomas Dobson on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var feedback = false
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .scaleEffect(scale)
                .foregroundStyle(Gradient(colors: [.red, .blue]))
                .sensoryFeedback(.success, trigger: feedback)
                .onTapGesture {
                    feedback.toggle()
                    withAnimation(.easeInOut(duration: 0.2)) {
                        scale = 1.5
                    }
                    Task {
                        try await Task.sleep(for: .seconds(0.2))
                        withAnimation(.easeInOut(duration: 0.2)) {
                            scale = 1.0
                        }
                    }
                }
                .animation(.bouncy, value: scale)
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
