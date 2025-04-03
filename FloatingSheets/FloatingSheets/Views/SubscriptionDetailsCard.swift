// File: `SubscriptionDetailsCard.swift`
// Language: Swift
//
// This file defines a SwiftUI view that shows details about an active subscription.
// It includes the subscription action icon and title, a message indicating the subscription status,
// and a display for the remaining number of subscription days.
// Detailed inline comments are provided for clarity and future review.

import SwiftUI

/// A SwiftUI view that displays the details of a subscription.
///
/// This view uses data from a shared subscription view model (`SubscriptionViewModel`)
/// to present information such as the selected subscription action, subscription status,
/// and remaining subscription days.
struct SubscriptionDetailsCard: View {
    /// An environment object providing subscription-related data and state.
    @EnvironmentObject var viewModel: SubscriptionViewModel
    
    /// The view's layout and behavior.
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: - Header Section (Icon and Title)
            HStack {
                // Display the subscription action's image.
                // If no action is selected, a default 'questionmark' icon is shown.
                Image(systemName: viewModel.selectedAction?.image ?? "questionmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(10)
                    // Background for the icon with opacity and circular shape.
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
                    // Add a slight shadow effect for visual depth.
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                
                // Display the subscription action's title.
                // If no action is selected, show 'Unknown'.
                Text(viewModel.selectedAction?.title ?? "Unknown")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            // MARK: - Subscription Active Message
            // Show a message indicating that the subscription is active.
            Text("Your subscription is active.")
                .font(.subheadline)
                .foregroundColor(Color.white.opacity(0.9))
                .padding([.bottom, .top], 15)
            
            // MARK: - Days Remaining Section
            HStack {
                // Label for remaining days.
                Text("Days Remaining:")
                    .font(.subheadline)
                    .foregroundColor(Color.white.opacity(0.9))
                // Display the number of remaining days in bold yellow text.
                Text("\(viewModel.subscrptionDaysRemaining) days")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
        }
        .padding() // Apply padding around the entire content.
        .background(
            // Apply a background gradient transitioning from purple to blue with opacity.
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.blue.opacity(0.7)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16) // Round the corners of the card.
        // Apply a shadow for a subtle depth effect.
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
        .padding(.horizontal) // Horizontal padding for layout alignment.
    }
}

#Preview {
    // Sample preview for SubscriptionDetailsCard.
    // A sample view model is created and configured to test the view.
    let sampleViewModel = SubscriptionViewModel()
    sampleViewModel.duration = "5"
    sampleViewModel.selectedAction = Action(image: "xbox.logo", title: "Game Pass")
    
    return SubscriptionDetailsCard()
        .environmentObject(sampleViewModel)
}
