//
//  ModalView.swift
//  ModalWithDismiss
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

// A reusable modal view that provides information about SwiftUI and a dismiss button.
struct ModalView: View {
    // The dismiss environment value to close the modal.
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            // Provides a description of SwiftUI.
            Text(
                """
                SwiftUI is a framework developed by Apple that allows developers to build user interfaces for Apple platforms (iOS, macOS, tvOS, watchOS) using the Swift programming language, providing a declarative way to design app layouts with a focus on simplicity and ease of use, enabling developers to create dynamic and visually appealing interfaces with relatively less code compared to traditional methods like UIKit. 
                """
            )
            .font(.system(size: 20))
            .padding()
            // A button that triggers the dismiss action.
            Button("Dismiss") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        // Aligns the modal content at the bottom and sets a medium-sized presentation detent.
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding()
        .presentationDetents([.medium])
    }
}

// A preview to show the ModalView in Xcode’s canvas.
#Preview {
    ModalView()
}
