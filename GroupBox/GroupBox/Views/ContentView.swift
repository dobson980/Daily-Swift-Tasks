//
//  ContentView.swift
//  GroupBox
//
//  Created by Tom Dobson on 12/10/25.
//

import SwiftUI

/// Main view demonstrating different ways to use `GroupBox`.
///
/// The first section wraps a terms-of-service style agreement, while
/// the second and third sections show how nested `GroupBox` views and
/// a custom `GroupBoxStyle` can organize a mini music player layout.
struct ContentView: View {

    /// Tracks whether the user has toggled the agreement switch.
    ///
    /// In a real app this might enable or disable a "Continue" button.
    @State private var userAgreed: Bool = false

    /// Placeholder text used to fill the agreement section.
    private var agreementText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    var body: some View {
        ZStack {
            // Simple gradient‑tinted background to contrast with the group boxes.
            Rectangle()
                .foregroundStyle(.pink.gradient.opacity(0.8))
                .ignoresSafeArea()

            VStack(spacing: 40) {
                // MARK: - Agreement group
                GroupBox {
                    // The agreement text scrolls inside the group box so it
                    // stays compact even with a long body of text.
                    ScrollView {
                        Text(agreementText)
                            .foregroundColor(.secondary)
                    }
                    .frame(height: 125)

                    // The toggle uses a binding to `userAgreed` so the state
                    // is owned by this view but driven by user interaction.
                    Toggle(isOn: $userAgreed) {
                        Text("I agree to the above terms")
                    }
                } label: {
                    Label("End-User Agreement", systemImage: "building.columns")
                        .foregroundColor(.primary)
                        .font(.title)
                }

                // MARK: - Nested group boxes for music sections
                GroupBox {
                    // A plain nested `GroupBox` without a custom style.
                    GroupBox {
                        MusicPlayerView()
                    }
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                        .foregroundColor(.pink)
                }

                GroupBox {
                    // The same nested player, but this outer group box
                    // uses the `.music` style defined in `MusicGroupBoxStyle`.
                    GroupBox {
                        MusicPlayerView()
                    }
                } label: {
                    Label("Previously Playing", systemImage: "music.note")
                }
                .groupBoxStyle(.music)
            }
            .padding()
        }
    }
}

#Preview {
    /// Preview for experimenting with the different `GroupBox` layouts.
    ContentView()
}
