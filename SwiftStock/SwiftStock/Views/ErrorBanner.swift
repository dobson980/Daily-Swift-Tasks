// File: `ErrorBanner.swift`

import SwiftUI

/**
 A SwiftUI view that displays an error banner.
 
 This banner presents a red rectangle with an overlaid error message. It transitions smoothly in
 and out by animating its vertical offset and listens for changes to automatically dismiss after a delay.
 */
struct ErrorBanner: View {
    /// A binding to a Boolean value indicating whether the error banner is currently visible.
    @Binding var isShowing: Bool
    
    /// The error message to display within the banner.
    let errorText: String
    
    /// The view's content and layout.
    var body: some View {
        VStack {
            // A red rounded rectangle representing the error banner.
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red) // Fills the rectangle with a red color.
                .frame(height: 50) // Sets the fixed height for the banner.
                .shadow(radius: 3) // Adds a shadow effect for depth.
                .overlay(
                    // Overlays the rectangle with the error text.
                    Text("Error: \(errorText)")
                        .foregroundColor(.white)  // Sets text color to white for contrast.
                )
        }
        .animation(.easeInOut(duration: 0.5), value: isShowing) // Animates changes based on 'isShowing'.
        .onChange(of: isShowing) {
            Task {
                // Pauses for 3 seconds before dismissing the banner.
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                // Animates the banner's dismissal.
                withAnimation {
                    isShowing = false
                }
            }
        }
        .offset(y: isShowing ? -350 : -500) // Adjusts the vertical position based on visibility.
        .padding()                          // Adds padding around the banner.
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
