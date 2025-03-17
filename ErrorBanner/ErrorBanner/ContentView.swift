//
//  ContentView.swift
//  ErrorBanner
//
//  Created by Thomas Dobson on 3/16/25.
//

import SwiftUI

// ContentView serves as the main view of the app and demonstrates how the ErrorBannerView works.
// It includes a countdown, a button to trigger a "self-destruct" sequence (i.e. an error),
// and overlays the error banner at the top of the screen when the error is triggered.
struct ContentView: View {
    // The current countdown value, shown as a large number.
    @State private var count: Int = 3
    // A Boolean that controls whether the error banner is displayed.
    @State private var selfDestructed: Bool = false
    // A Boolean that indicates if the countdown is active. While true, the countdown number is visible.
    @State private var countingDown: Bool = false
    
    var body: some View {
        // ZStack is used to layer the error banner behind the main content.
        ZStack {
            // ErrorBannerView is the custom error banner that slides down when an error occurs.
            // It is controlled by the 'selfDestructed' binding. When true, the banner appears.
            ErrorBannerView(presentError: $selfDestructed, errorMessage: "BOOM!!!")
            
            // The main content is organized in a vertical stack.
            VStack {
                Spacer()  // Spacer pushes content towards the center vertically.
                
                // The countdown number, displayed in a large, bold font.
                // Its opacity is controlled by 'countingDown', so it only appears during the countdown.
                Text("\(count)")
                    .font(.system(size: 80, weight: .bold))
                    .opacity(countingDown ? 1 : 0)
                
                Spacer()  // Spacer adds vertical space below the countdown.
                
                // The button triggers the self-destruct sequence.
                // When pressed, it calls the 'triggerSelfDestruct()' function.
                Button {
                    triggerSelfDestruct()
                } label: {
                    ZStack {
                        // The button background is a rounded rectangle filled with red.
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.red)
                            .frame(width: 200, height: 50)
                        // The button label text.
                        Text("Trigger Self Destruct")
                            .foregroundStyle(.white)
                    }
                }
                // The button is disabled if the error banner is currently displayed or if a countdown is in progress.
                .disabled(selfDestructed || countingDown)
            }
            .padding()  // Padding around the VStack keeps the content away from the screen edges.
        }
    }
    
    // triggerSelfDestruct() simulates a self-destruct sequence.
    // It starts a countdown, displays the error banner, waits a set period, and then resets the state.
    func triggerSelfDestruct() {
        // Start a new asynchronous task.
        Task {
            // Begin the countdown by setting countingDown to true.
            countingDown = true
            
            // While the count is greater than zero, decrement every second.
            while count > 0 {
                try await Task.sleep(for: .seconds(1))
                // Animate the countdown decrement with a bouncy effect.
                withAnimation(.bouncy) {
                    count -= 1
                }
            }
            
            // Once the countdown finishes, turn off the countdown indicator.
            countingDown = false
            // Trigger the error banner by setting selfDestructed to true.
            selfDestructed = true
            // Wait 5 seconds while the error banner is visible.
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
