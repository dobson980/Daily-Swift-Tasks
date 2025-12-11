//
//  MusicPlayerView.swift
//  GroupBox
//
//  Created by Tom Dobson on 12/10/25.
//

import SwiftUI

/// A simple, static music player row used inside the group boxes.
///
/// This view intentionally keeps layout and styling straightforward so
/// the focus stays on how it is embedded inside different `GroupBox` styles.
struct MusicPlayerView: View {
    var body: some View {
        VStack {
            // MARK: - Track info row
            HStack {
                // Placeholder for album artwork.
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 2) {
                    Text("Cool Song Title")
                        .font(.headline.bold())

                    Text("Artist Name")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }
            .padding(.bottom, 8)

            // MARK: - Playback progress
            ProgressView(value: 0.4, total: 1)
                .tint(.secondary)
                .padding(.bottom, 20)

            // MARK: - Transport controls
            HStack(spacing: 30) {
                Image(systemName: "backward.fill")
                Image(systemName: "pause.fill")
                Image(systemName: "forward.fill")
            }
            .foregroundStyle(.secondary)
            .font(.title)
        }
    }
}

#Preview {
    /// Preview for quickly iterating on the music row layout.
    MusicPlayerView()
}
