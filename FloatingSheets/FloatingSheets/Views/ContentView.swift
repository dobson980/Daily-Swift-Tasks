// File: `ContentView.swift`
// Language: Swift
//
// This file defines the main view of the application using SwiftUI.
// It displays subscription details, subscription options, and manages transitions between different views
// such as subscription actions, period selection, and custom duration entry using a system tray view.
// Detailed inline comments are provided for clarity and future reference.

import SwiftUI

/// The primary view for displaying subscription information and managing subscription actions.
/// It conditionally displays either subscription details or a prompt to subscribe,
/// and toggles between various subscription-related views using a custom system tray.
struct ContentView: View {
    
    /// The shared subscription view model that manages subscription state and behavior.
    @EnvironmentObject var viewModel: SubscriptionViewModel
    
    /// The main view layout.
    var body: some View {
        VStack {
            // Display the header text based on the subscription state.
            // If user is subscribed and the subscription sheet is hidden, show subscription details title.
            // Otherwise, prompt the user to choose a subscription.
            Text((viewModel.isSubscribed && !viewModel.show) ? "Your Subscription" : "Choose Subscription")
                .font(.title2)
                .transition(.opacity)
            
            // Conditionally display the subscription details card if the user is subscribed and not editing.
            if viewModel.isSubscribed && !viewModel.show {
                Spacer()
                // The SubscriptionDetailsCard view displays current subscription details.
                SubscriptionDetailsCard()
                    .transition(.scale)
            }
            
            Spacer()
            
            // Button to toggle the subscription sheet display.
            // The label changes based on whether the subscription is active.
            Button((viewModel.isSubscribed && !viewModel.show) ? "Edit Subscription" : "Subscribe!") {
                // Toggle the display of the subscription sheet.
                viewModel.show.toggle()
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            // Attach a custom system tray view that overlays subscription options.
            .systemTrayView($viewModel.show) {
                VStack(spacing: 15) {
                    ZStack {
                        // Switch the displayed view based on the current view state.
                        switch viewModel.currentView {
                        // Display subscription actions.
                        case .actions: SubscriptionSheet()
                                .transition(.blurReplace)
                        // Display period selection view.
                        case .periods: PeriodSheet()
                                .transition(.blurReplace)
                        // Display custom duration keypad.
                        case .keypad: CustomDurationSheet()
                                .transition(.blurReplace)
                        }
                    }
                    .compositingGroup()
                    
                    // 'Continue' button to navigate through subscription views.
                    Button {
                        withAnimation(.bouncy) {
                            // If not on the actions view and valid subscription details are provided,
                            // close the system tray and reset to actions.
                            if viewModel.currentView != .actions &&
                                ((viewModel.selectedPeriod != nil) || (!viewModel.duration.isEmpty)) {
                                viewModel.show.toggle()
                                viewModel.currentView = .actions
                                return
                            }
                            // Transition between subscription views as per the current state.
                            switch viewModel.currentView {
                            case .actions:
                                viewModel.currentView = .periods
                            case .periods:
                                viewModel.currentView = .keypad
                            case .keypad:
                                viewModel.currentView = .actions
                            }
                        }
                    } label: {
                        // Button label configuration and styling.
                        Text("Continue")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .foregroundStyle(.white)
                            .background(.blue, in: .capsule)
                    }
                    .padding(.top, 10)
                }
                .padding(20) // Padding around the system tray content.
            }
        }
    }
}

/// Enumeration to represent the current state of the subscription UI.
/// Used to determine which view to display in the system tray.
enum CurrentView {
    case actions   // Display subscription actions.
    case periods   // Display period selection.
    case keypad    // Display custom duration keypad.
}

#Preview {
    // A sample view model instance for previewing the ContentView layout and behavior.
    let sampleViewModel = SubscriptionViewModel()
    return ContentView()
        .environmentObject(sampleViewModel)
}
