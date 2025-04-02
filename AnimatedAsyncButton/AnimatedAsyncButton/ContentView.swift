//
//  ContentView.swift
//  AnimatedAsyncButton
//
//  Created by Thomas Dobson on 4/2/25.
//

import SwiftUI

/// A view that displays the main content of the AnimatedAsyncButton application.
///
/// This view displays a dynamic text message and an animated button. The displayed text
/// and button configuration change based on the current transaction state.
struct ContentView: View {
    /// The current state of the transaction.
    /// This state drives the UI by updating the text, background gradient, and button properties.
    @State private var state: TransactionState = .idle
    
    /// The view's body that defines its layout and appearance.
    /// It consists of:
    /// - A dynamic text view indicating the payment status.
    /// - An animated button that triggers transaction state changes.
    var body: some View {
        VStack {
            Spacer()
            
            // Display a dynamic text message based on the current transaction state.
            Text(state == .idle ? "Tap below to pay your bill" : "Working on your Payment")
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .padding()
                .background(
                    // Apply a linear gradient background that varies with the state color.
                    LinearGradient(
                        gradient: Gradient(colors: [state.color, state.color.opacity(0.7)]),
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing)
                )
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 3)
                .animation(.easeInOut(duration: 0.25), value: state)
            Spacer()
            
            // Configure the animated button based on the current transaction state.
            let config = AnimatedButton.Config(
                title: state.rawValue,
                foregroundColor: .white,
                backgroundColor: state.color,
                symbolImage: state.image
            )
            
            // Display the AnimatedButton.
            AnimatedButton(config: config) {
                // Sequentially update the state with delays to simulate async tasks.
                state = .analyzing
                try? await Task.sleep(for: .seconds(3))
                state = .processing
                try? await Task.sleep(for: .seconds(3))
                state = .failure
                try? await Task.sleep(for: .seconds(1))
                state = .idle
            }
            .animation(.easeInOut(duration: 0.25), value: state)
        }
    }
}

/// An enumeration representing the various states of a transaction.
///
/// Each case includes a raw string value for the display title, a corresponding color, and
/// an optional image name to be used in the UI.
enum TransactionState: String {
    /// Represents the idle state with a prompt to pay.
    case idle = "Tap to Pay"
    /// Represents the state where the transaction is being analyzed.
    case analyzing = "Analyzing Transaction"
    /// Represents the state where the payment is processing.
    case processing = "Processing Payment"
    /// Represents the state where the payment was successful.
    case success = "Payment Successful"
    /// Represents the state where the payment failed.
    case failure = "Payment Failed"
    
    /// Returns the color associated with each transaction state.
    var color: Color {
        switch self {
        case .idle:
            return .black
        case .analyzing:
            return .blue
        case .processing:
            return Color(red: 0.8, green: 0.35, blue: 0.2)
        case .success:
            return .green
        case .failure:
            return .red
        }
    }
    
    /// Returns the system image name associated with each transaction state.
    var image: String? {
        switch self {
        case .idle:
            return "apple.logo"
        case .analyzing:
            return nil
        case .processing:
            return nil
        case .success:
            return "checkmark.circle.fill"
        case .failure:
            return "xmark.circle.fill"
        }
    }
}

#Preview {
    ContentView()
}
