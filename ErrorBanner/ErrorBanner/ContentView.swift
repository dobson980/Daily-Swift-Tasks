//
//  ContentView.swift
//  ErrorBanner
//
//  Created by Thomas Dobson on 3/16/25.
//

import SwiftUI

// ContentView serves as the main view demonstrating the ErrorBannerView and a self-destruct trigger.
// It includes a countdown and a button that triggers the error banner. The button's appearance
// changes when it's disabled, i.e. when either an error is being displayed or the countdown is active.
struct ContentView: View {
    // The current countdown value, displayed in large numbers.
    @State private var count: Int = 3
    // Controls whether the error banner (self-destruct) is displayed.
    @State private var selfDestructed: Bool = false
    // Indicates whether the countdown is actively running.
    @State private var countingDown: Bool = false
    
    var body: some View {
        // ZStack layers the error banner behind the main content.
        ZStack {
            // ErrorBannerView appears at the top when selfDestructed is true.
            ErrorBannerView(presentError: $selfDestructed, errorMessage: "BOOM!!!")
            
            // Main content arranged vertically.
            VStack {
                Spacer() // Pushes the content toward the center vertically.
                
                // Displays the countdown number with a large, bold font.
                // Its opacity is controlled by countingDown so that it only shows during the countdown.
                Text("\(count)")
                    .font(.system(size: 80, weight: .bold))
                    .opacity(countingDown ? 1 : 0)
                
                Spacer() // Provides vertical spacing below the countdown.
                
                // Button that triggers the self-destruct sequence.
                Button {
                    triggerSelfDestruct()
                } label: {
                    ZStack {
                        // Button background:
                        // Uses a rounded rectangle with red fill when active.
                        // When disabled (selfDestructed or countingDown is true), it changes to a light gray.
                        RoundedRectangle(cornerRadius: 20)
                            .fill((selfDestructed || countingDown) ? Color(.systemGray6) : Color.red)
                            .frame(width: 200, height: 50)
                        
                        // Button label text:
                        // The text appears in white when active and in black when disabled,
                        // making the disabled state visually distinct.
                        Text("Trigger Self Destruct")
                            .foregroundStyle((selfDestructed || countingDown) ? Color.black : Color.white)
                    }
                }
                // Disable the button when the error banner is shown or the countdown is active.
                .disabled(selfDestructed || countingDown)
            }
            .padding() // Adds padding around the main content.
        }
    }
    
    // triggerSelfDestruct() simulates a self-destruct sequence by starting a countdown,
    // displaying the error banner, waiting for a period, and then resetting the state.
    func triggerSelfDestruct() {
        Task {
            // Begin the countdown.
            countingDown = true
            
            // Countdown loop: decrement 'count' every second.
            while count > 0 {
                try await Task.sleep(for: .seconds(1))
                // Animate the countdown decrement with a bouncy effect.
                withAnimation(.bouncy) {
                    count -= 1
                }
            }
            
            // End the countdown.
            countingDown = false
            // Show the error banner by setting selfDestructed to true.
            selfDestructed = true
            // Keep the error banner visible for 5 seconds.
            try await Task.sleep(for: .seconds(5))
            // Reset the countdown and hide the error banner.
            count = 3
            selfDestructed = false
        }
    }
}

#Preview {
    ContentView()
}
