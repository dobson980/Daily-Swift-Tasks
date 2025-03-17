//
//  ErrorBannerView.swift
//  ErrorBanner
//
//  Created by Thomas Dobson on 3/16/25.
//

import SwiftUI

// ErrorBannerView is a reusable view that displays an error message banner.
// The banner slides down from the top when 'presentError' is true, and slides back up when false.
struct ErrorBannerView: View {
    // Binding to control whether the error banner is shown.
    @Binding var presentError: Bool
    // The error message to display on the banner.
    @State var errorMessage: String
    
    var body: some View {
        ZStack {
            // The background of the banner is a rounded rectangle with a red fill.
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
                .frame(height: 60) // Fixed height for the banner.
            // The error message text is displayed on top of the red background.
            Text(errorMessage)
                .foregroundStyle(.white) // White text for contrast.
                .font(.headline)         // Use a headline font style.
        }
        .padding() // Padding keeps the banner away from the edges of the screen.
        // Animate changes to the 'presentError' state with an easeInOut transition over 0.5 seconds.
        .animation(.easeInOut(duration: 0.5), value: presentError)
        // Offset the banner vertically:
        // When presentError is true, the banner is positioned at -350 (visible on screen);
        // when false, it moves to -800 (off-screen).
        .offset(y: presentError ? -350 : -800)
    }
}

// Two previews are provided for ErrorBannerView:
// One when the banner is not presented, and one when it is presented.
#Preview("Not Presented") {
    @Previewable @State var errorObserved: Bool = false
    @Previewable @State var errorMessage: String = "Something went wrong!"
    ErrorBannerView(presentError: $errorObserved, errorMessage: errorMessage)
}

#Preview("Presented") {
    @Previewable @State var errorObserved: Bool = true
    @Previewable @State var errorMessage: String = "Something went wrong!"
    ErrorBannerView(presentError: $errorObserved, errorMessage: errorMessage)
}
