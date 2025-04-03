// File: `PeriodSheet.swift`
// Language: Swift
//
// This file defines a SwiftUI view that allows users to select a subscription period.
// It displays a header with a title and a close button, instructions, and a grid of period options.
// Detailed inline documentation is included below for clarity and future reference.

import SwiftUI

/// A SwiftUI view for selecting a subscription period.
///
/// The view displays a header with a title and a close button that returns the user
/// to the previous screen. It shows descriptive text and a grid of selectable period options.
struct PeriodSheet: View {
    /// The subscription view model injected from the environment.
    /// It holds the current subscription state and data.
    @EnvironmentObject var viewModel: SubscriptionViewModel
    
    /// The body property defines the view's layout and behavior.
    var body: some View {
        VStack {
            // MARK: - Header Section
            HStack {
                // Header title text for the period selection screen.
                Text("Choose Period")
                    .font(.title2)            // Set the title font size.
                    .fontWeight(.semibold)     // Apply semibold font weight.
                
                Spacer(minLength: 0)          // Pushes the close button to the far right.
                
                // Button to close the period sheet and return to the previous view.
                Button {
                    // Animate the transition using a bouncy effect.
                    withAnimation(.bouncy) {
                        viewModel.currentView = .actions
                    }
                } label: {
                    // Display a close icon.
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)                                // Set the icon size.
                        .foregroundStyle(Color.gray, Color.primary.opacity(0.1)) // Style the icon.
                }
            }
            .padding(.bottom, 25)              // Add padding below the header section.
            
            // MARK: - Instruction Text Section
            // Display a descriptive instruction text for period selection.
            Text("Choose the period you want \nto subscribe for")
                .multilineTextAlignment(.center) // Center align multiple lines.
                .foregroundStyle(.gray)          // Set text color to gray.
                .padding(.bottom, 20)            // Add padding below the instruction text.
            
            // MARK: - Period Options Grid Section
            // Create a grid layout with 3 columns for displaying period buttons.
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 15) {
                // Iterate over each period option in the periods array.
                ForEach(periods) { period in
                    // Determine whether the current period is selected.
                    let isSelected: Bool = viewModel.selectedPeriod?.id == period.id
                    
                    VStack(spacing: 6) {
                        // Display the period's title.
                        Text(period.title)
                            .font(period.value == 0 ? .title3 : .title2) // Use different font sizes based on value.
                            .fontWeight(.semibold)                        // Apply semibold font weight.
                        
                        // Display additional text for non-custom periods.
                        if period.value != 0 {
                            Text(period.value == 1 ? "Month" : "Months")
                                .font(.caption)                         // Set caption font for the label.
                                .foregroundStyle(.gray)                  // Apply gray color to the label.
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)           // Set a uniform height for each period button.
                    .background {
                        // Create a rounded rectangle background that is blue if selected,
                        // otherwise a gray color with opacity adjustments.
                        RoundedRectangle(cornerRadius: 20)
                            .fill(isSelected ? .blue : .gray.opacity(isSelected ? 0.2 : 0.1))
                    }
                    .contentShape(.rect)         // Ensure the tap area covers the whole rectangle.
                    .onTapGesture {
                        // Animate the tap interaction using a snappy animation.
                        withAnimation(.snappy) {
                            if period.value == 0 {
                                // If custom period, switch to keypad view and reset duration.
                                viewModel.currentView = .keypad
                                viewModel.duration = ""
                            } else {
                                // Toggle the selected period.
                                viewModel.selectedPeriod = isSelected ? nil : period
                            }
                        }
                    }
                }
            }
        }
    }
}

/// #Preview for the `PeriodSheet` view.
#Preview {
    let sampleViewModel = SubscriptionViewModel()
    sampleViewModel.currentView = .periods
    sampleViewModel.selectedPeriod = nil
    
    return PeriodSheet()
        .environmentObject(sampleViewModel)
}
