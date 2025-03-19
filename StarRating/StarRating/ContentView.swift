//
//  ContentView.swift
//  StarRating
//
//  Created by Thomas Dobson on 3/18/25.
//

import SwiftUI

/// The main view displaying a star rating interface.
///
/// This view arranges several UI elements using a vertical stack (VStack):
///  - A title text asking the user to rate the app.
///  - A star rating interface provided by `StarRatingView`, which allows the user to select a rating.
///  - A text label displaying the numeric value of the current rating, which becomes invisible when no rating is selected.
///
/// The current rating is stored as a state variable and passed to the `StarRatingView` as a binding.
struct ContentView: View {
    /// The state variable that holds the current user-selected rating.
    @State private var rating = 0
    
    /// The body property describes the view's content and layout.
    var body: some View {
        VStack {
            // Displays the app rating prompt with a larger font.
            Text("Rate my App!")
                .font(.system(size: 30))
                .padding(.bottom, 50)
            
            // Integrates the star rating view, passing a binding to `rating`.
            StarRatingView(rating: $rating)
                .padding(.bottom, 50)
            
            // Shows the current rating as text.
            // If no rating is selected (i.e. rating == 0), the text is hidden by setting the opacity to 0.
            Text("You rated this app \(rating) stars.")
                .opacity(rating == 0 ? 0 : 1)
        }
        .padding()
    }
}

// MARK: - Preview

/// Provides a preview of `ContentView` for Xcode’s design canvas.
#Preview {
    ContentView()
}
