//
//  ContentView.swift
//  SwiftUIProgress
//
//  Created by Thomas Dobson on 2/25/25.
//

import SwiftUI

// This struct defines the main content view for the progress bar example.
struct ContentView: View {
    // State variable that tracks the current progress percentage (0.0 to 1.0).
    @State private var progress = 0.0
    // State variable that indicates whether the download is active.
    @State private var downloading = false
    // State variable controlling the opacity of the progress display.
    @State private var progressOpacity = 0.0
    // State variable to store the running download task.
    @State private var downloadTask: Task<Void, Never>? = nil
    
    var body: some View {
        // A GeometryReader to get the available screen width for the progress bar.
        GeometryReader { geometry in
            VStack {
                Spacer() // Adds space at the top.
                
                // A container that displays the progress text and progress bar.
                VStack(alignment: .center) {
                    // A text label showing the current progress as a percentage.
                    Text("Progress")
                    // Displays the progress percentage as a formatted number.
                    Text(String(format: "%.0f%%", progress * 100))
                    // The progress bar itself, rendered as a capsule.
                    HStack {
                        Capsule()
                            .foregroundColor(.blue) // Sets the color of the capsule.
                            .frame(
                                width: max(5, progress * (geometry.size.width - (10 * 2))), // Calculates the width based on progress.
                                height: 20 // Fixed height for the capsule.
                            )
                            .padding(.horizontal, 10) // Adds padding around the capsule.
                            .animation(.easeOut, value: progress) // Animates changes to the progress.
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // Ensures the capsule aligns to the leading edge.
                }
                .opacity(progressOpacity) // Controls the opacity of the progress display.
                
                Spacer() // Adds space below the progress section.
                
                // A button that starts or stops the download.
                Button {
                    if downloading {
                        // If already downloading, cancel the running task.
                        downloadTask?.cancel()
                        downloadTask = nil
                        // Reset the state.
                        downloading.toggle()
                        progress = 0.0
                        progressOpacity = 0.0
                    } else {
                        downloading.toggle() // Toggle the downloading state to start.
                    }
                } label: {
                    // The button label changes depending on the current state.
                    Text(!downloading ? "Start the download" : "Reset")
                }
                .buttonStyle(.borderedProminent) // Use a prominent bordered button style.
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Makes the VStack fill the entire available space.
            // Observe changes to the `downloading` state.
            .onChange(of: downloading) {
                if downloading {
                    // If the download starts, show the progress indicator and start the download task.
                    progressOpacity = 1.0
                    downloadTask = Task {
                        while progress < 1 {
                            try? await Task.sleep(nanoseconds: 50_000_000) // Pause briefly.
                            if Task.isCancelled { return } // Exit if the task is canceled.
                            progress = min(progress + 0.005, 1.0) // Increment progress.
                            print(String(format: "Progress updated: %.2f", progress)) // Print progress updates.
                        }
                        // If download completes successfully, hide the progress indicator.
                        progressOpacity = 0
                        downloading.toggle()
                        downloadTask = nil
                    }
                } else {
                    // Reset progress and opacity when the download stops.
                    progress = 0.0
                    progressOpacity = 0.0
                }
            }
        }
    }
}

// Xcode preview to see ContentView in the canvas.
#Preview {
    ContentView()
}
