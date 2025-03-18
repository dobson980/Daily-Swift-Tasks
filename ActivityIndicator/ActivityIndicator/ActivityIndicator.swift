//
//  ActivityIndicator.swift
//  ActivityIndicator
//
//  Created by Thomas Dobson on 3/17/25.
//

import SwiftUI

// ActivityIndicator is a simple view that displays an SF Symbol used for showing a loading indicator.
// It uses a binding to control whether it is animating, so that you can easily turn it on or off from a parent view.
struct ActivityIndicator: View {
    // A binding to a Boolean that indicates if the activity indicator should be animating.
    // Although this variable is not directly used in this file, it allows the parent view to control its state.
    @Binding var isAnimating: Bool
    
    var body: some View {
        // Display an SF Symbol representing a loading indicator.
        // The chosen symbol "arrow.trianglehead.2.clockwise.rotate.90.circle" suggests rotation/loading.
        // The font modifier sets the size of the icon.
        Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90.circle")
            .font(.system(size: 100))
    }
}

// A preview for ActivityIndicator to test it in Xcode's canvas.
#Preview {
    // The @Previewable macro along with a @State variable lets you interact with the indicator in the preview.
    @Previewable @State var animate: Bool = true
    ActivityIndicator(isAnimating: $animate)
}
