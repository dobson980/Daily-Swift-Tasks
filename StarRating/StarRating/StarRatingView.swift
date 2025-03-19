//
//  StarRatingView.swift
//  StarRating
//
//  Created by Thomas Dobson on 3/18/25.
//

import SwiftUI

/// A view that displays a star rating interface.
/// 
/// This view uses a horizontal stack (HStack) of buttons to represent
/// each star. The stars are displayed as filled or unfilled based on the
/// current rating value. Tapping a star sets the rating to that star's index.
/// 
/// The maximum number of stars is defined by the private constant `maxRating`.
struct StarRatingView: View {
    /// A binding to the integer representing the current rating.
    /// 
    /// The value of `rating` is updated when a star is tapped.
    @Binding var rating: Int
    
    /// The maximum number of stars to be displayed.
    /// This is a private constant set to 5.
    private let maxRating: Int = 5
    
    /// The content and behavior of this view.
    /// 
    /// The view consists of a horizontal stack of buttons,
    /// each representing a star. The appearance of each star is
    /// determined by whether its index is less than or equal to the current `rating`.
    var body: some View {
        HStack {
            // Iterates over each index from 1 to maximum rating value.
            ForEach(1...maxRating, id: \.self) { index in
                // Each star is a button that, when tapped, updates the rating.
                Button {
                    rating = index
                } label: {
                    // Displays a filled star if the index is less than or equal to the rating,
                    // otherwise, it displays an unfilled star.
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .font(.title)
                }
            }
        }
    }
}

// MARK: - Preview

/// A preview provider to display the StarRatingView in the Xcode canvas.
/// 
/// This preview initializes the rating with a default value of 4.
#Preview {
    @Previewable @State var rating = 4
    StarRatingView(rating: $rating)
}
