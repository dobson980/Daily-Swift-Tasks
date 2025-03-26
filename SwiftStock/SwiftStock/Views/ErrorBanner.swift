//
//  ErrorBanner.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/25/25.
//

import SwiftUI

struct ErrorBanner: View {
    @Binding var isShowing: Bool
    let errorText: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
                .frame(height: 50)
                .shadow(radius: 3)
                .overlay(
                    Text("Error: \(errorText)")
                        .foregroundColor(.white)
                )
        }
        .animation(.easeInOut(duration: 0.5), value: isShowing)
        .onChange(of: isShowing) {
            Task {
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                withAnimation {
                    isShowing = false
                }
            }
        }
        .offset(y: isShowing ? -350 : -500)
        .padding()

    }
}

#Preview("Error Banner Shown") {
    @Previewable @State var isShowing = true
    ErrorBanner(isShowing: $isShowing, errorText: "Invalid stock symbol")
}

#Preview("Error Banner Hidden") {
    @Previewable @State var isShowing = false
    ErrorBanner(isShowing: $isShowing, errorText: "Unable to load data")
}
