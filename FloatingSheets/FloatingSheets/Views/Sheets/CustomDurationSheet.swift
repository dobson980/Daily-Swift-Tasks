//
//  CustomDurationSheet.swift
//  FloatingSheets
//
//  Created by Thomas Dobson on 4/3/25.
//

import SwiftUI

/// A SwiftUI view that provides an interface for entering a custom subscription duration.
/// It presents a title header, a large display for the current duration value in days, and a numeric keypad.
/// Users interact with the keypad to input a duration, and an action button to return to the period selection view.
struct CustomDurationSheet: View {
    /// The view model that holds the subscription state and data.
    @EnvironmentObject var viewModel: SubscriptionViewModel
    
    /// The body property defines the view layout and behavior.
    var body: some View {
        VStack {
            // MARK: - Header Section
            HStack {
                // Display the title for the duration input.
                Text("Custom Duration")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                // Spacer pushes the close button to the far right.
                Spacer(minLength: 0)
                
                // A button to exit the custom duration screen and return to the period selection view.
                Button {
                    // Animate the transition with a bouncy effect.
                    withAnimation(.bouncy) {
                        viewModel.currentView = .periods
                    }
                } label: {
                    // Display an icon representing the close action.
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(Color.gray, Color.primary.opacity(0.1))
                }
            }
            .padding(.bottom, 10)
            
            // MARK: - Duration Display Section
            VStack(spacing: 6) {
                // Show the current duration entered by the user.
                // If no duration has been entered, display "0".
                Text(viewModel.duration.isEmpty ? "0" : viewModel.duration)
                    .font(.system(size: 60, weight: .black))
                    // Animate numeric transitions when the number changes.
                    .contentTransition(.numericText())
                
                // Label indicating that the value represents days.
                Text("Days")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical, 20)
            
            // MARK: - Keypad Grid Section
            // A grid layout to display the keypad buttons for user input.
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 15) {
                // Iterate over the keypadValues collection to create buttons.
                ForEach(keypadValues) { keyValue in
                    Group {
                        // Check if the key represents a backspace action.
                        if keyValue.isBack {
                            // Intended to display a backspace icon.
                            Image(systemName: "keyValue.title")
                        } else {
                            // Display the numeric value as text.
                            Text(keyValue.title)
                        }
                    }
                    .font(.title2)
                    .fontWeight(.semibold)
                    // Ensure each key button spans the available width and has a uniform height.
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .onTapGesture {
                        // Animate the entry or deletion on key tap.
                        withAnimation(.snappy) {
                            if keyValue.isBack {
                                // Remove the last digit if the duration is not empty.
                                if !viewModel.duration.isEmpty {
                                    viewModel.duration.removeLast()
                                }
                            } else {
                                // Append the tapped number to the current duration.
                                viewModel.duration.append(keyValue.title)
                            }
                            // Reset any previously selected period when a new duration is entered.
                            viewModel.selectedPeriod = nil
                        }
                    }
                }
            }
            // Adjust horizontal padding to align keypad buttons properly.
            .padding(.horizontal, -15)
        }
    }
}

#Preview {
    let sampleViewModel = SubscriptionViewModel()
    sampleViewModel.duration = "5"         // Set a sample duration for preview.
    sampleViewModel.currentView = .actions  // Set initial view state for preview.
    
    return CustomDurationSheet()
        .environmentObject(sampleViewModel)
}
