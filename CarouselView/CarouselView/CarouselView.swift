//
//  CarouselView.swift
//  CarouselView
//
//  Created by Thomas Dobson on 3/14/25.
//

import SwiftUI

// CarouselView displays a horizontally scrolling list of workout cards.
// Each card represents a workout and includes an icon and a name.
struct CarouselView: View {
    // An array of WorkOut objects that represent the items to be displayed.
    // Each WorkOut contains a name and an associated SF Symbol.
    private var workOuts: [WorkOut] = [
        WorkOut(name: "Walking", symbol: "figure.walk"),
        WorkOut(name: "Running", symbol: "figure.run"),
        WorkOut(name: "Boxing", symbol: "figure.boxing"),
        WorkOut(name: "Core", symbol: "figure.core.training"),
        WorkOut(name: "Stretching", symbol: "figure.cooldown"),
        WorkOut(name: "Cross Training", symbol: "figure.cross.training"),
        WorkOut(name: "Dance", symbol: "figure.dance"),
        WorkOut(name: "Hiking", symbol: "figure.hiking"),
        WorkOut(name: "Cycle", symbol: "figure.indoor.cycle"),
        WorkOut(name: "Yoga", symbol: "figure.mind.and.body")
    ]
    
    var body: some View {
        // A horizontal ScrollView that allows users to scroll through the workout cards.
        ScrollView(.horizontal) {
            // An HStack arranges the cards side-by-side with default spacing.
            HStack {
                // For each workout in the workOuts array, create a card.
                ForEach(workOuts, id: \.self) { workOut in
                    // Each card is built using a ZStack to layer background and content.
                    ZStack {
                        // The background of the card is a rounded rectangle.
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemCyan)) // Use a cyan color for the background.
                            .frame(width: 200, height: 200) // Fixed dimensions for each card.
                        // VStack holds the image and text vertically.
                        VStack {
                            // Display the workout's symbol (an SF Symbol).
                            // The symbol is rendered in a large font size with white color.
                            Image(systemName: "\(workOut.symbol)")
                                .font(.system(size: 70))
                                .padding(.bottom, 5)
                                .foregroundStyle(.white)
                            // Display the workout's name.
                            Text("\(workOut.name)")
                                .font(.system(size: 30))
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        // Add padding around the ScrollView for better layout spacing.
        .padding()
    }
}

// The WorkOut struct defines a simple model for each workout.
// It conforms to Hashable, which allows it to be used in a ForEach loop.
struct WorkOut: Hashable {
    var name: String    // The name of the workout (e.g., "Walking").
    var symbol: String  // The SF Symbol associated with the workout (e.g., "figure.walk").
}

// Preview using the new #Preview macro for interactive testing in Xcode.
#Preview {
    CarouselView()
}
