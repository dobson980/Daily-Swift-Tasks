// File: `SubscriptionSheet.swift`
// Language: Swift
//
// This file defines a SwiftUI view for selecting a subscription action.
// It displays a header with a title and a close button, then iterates over
// available subscription actions. Tapping an action toggles its selection.
// Detailed inline comments are provided for later review.

import SwiftUI

/// A SwiftUI view that displays a list of subscription actions and allows the user
/// to select one. It includes a header with a title and a close button.
/// The view leverages an EnvironmentObject for accessing and modifying subscription state.
struct SubscriptionSheet: View {
    /// The view model for subscription handling injected from the environment.
    /// It manages subscription state and UI behavior.
    @EnvironmentObject var viewModel: SubscriptionViewModel
    
    /// The body property defines the layout and behavior of the subscription sheet.
    var body: some View {
        VStack {
            // MARK: - Header Section
            HStack {
                // Display the header title for the subscription selection.
                Text("Choose Subscription")
                    .font(.title2)         // Set the font size for the title.
                    .fontWeight(.semibold)  // Emphasize the title with semibold weight.
                
                Spacer(minLength: 0)       // Fill remaining space to push the button to the right.
                
                // Close button to dismiss the subscription sheet.
                Button {
                    viewModel.show = false  // Set the view model flag to hide the sheet.
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)     // Icon size configuration.
                        .foregroundStyle(Color.gray, Color.primary.opacity(0.1))
                        // Applies a combined styling to blend gray and primary color with opacity.
                }
            }
            .padding(.bottom, 10)  // Add space below the header section.
            
            // MARK: - Subscription Actions List
            // Iterate over the predefined subscription actions.
            ForEach(actions) { action in
                // Determine if the current action is selected.
                let isSelected: Bool = viewModel.selectedAction?.id == action.id
                
                // Action row layout.
                HStack(spacing: 10) {
                    // Display the system image for the action.
                    Image(systemName: action.image)
                        .font(.title)  // Set size for the icon.
                        .frame(width: 40)  // Fix the width for icon layout consistency.
                    
                    // Display the title text for the action.
                    Text(action.title)
                        .fontWeight(.semibold)  // Use semibold weight for emphasis.
                    
                    Spacer(minLength: 0)  // Push the checkmark icon to the far right.
                    
                    // Display a checkmark if selected, otherwise a default circle.
                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
                        .font(.title)     // Set icon font size.
                        .contentTransition(.symbolEffect)  // Animate symbol changes smoothly.
                        .foregroundStyle(isSelected ? .blue : .gray.opacity(0.2))
                        // Uses color to indicate selection status.
                }
                .padding(.vertical, 6)  // Vertical padding for each action row.
                .contentShape(.rect)    // Ensures the tap area spans the full row.
                .onTapGesture {
                    // Animate the selection transition using a snappy animation style.
                    withAnimation(.snappy) {
                        // Toggle selected action state.
                        viewModel.selectedAction = isSelected ? nil : action
                    }
                }
            }
            
        }
    }
}

/// #Preview for the `SubscriptionSheet` view.
/// Provides a sample view model instance for previewing the layout and behavior.
#Preview {
    let sampleViewModel = SubscriptionViewModel()
    sampleViewModel.show = true                // Enable display for the sheet.
    sampleViewModel.currentView = .actions     // Set initial view state.
    
    return SubscriptionSheet()
        .environmentObject(sampleViewModel)
}
