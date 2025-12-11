//
//  MusicGroupBoxStyle.swift
//  GroupBox
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// A custom `GroupBoxStyle` that gives music sections a card‑like look.
///
/// Think of this as a **theme** for all `GroupBox` views that use it.
/// Instead of repeating padding, backgrounds, and label styling
/// everywhere, you define it once here and apply it with
/// `.groupBoxStyle(.music)`.
struct MusicGroupBoxStyle: GroupBoxStyle {

    /// Called by SwiftUI to build the final view for a `GroupBox`.
    ///
    /// - Parameter configuration:
    ///   Contains the pieces provided by the caller of `GroupBox`:
    ///   - `configuration.label`: the label closure you wrote
    ///   - `configuration.content`: the content closure you wrote
    ///
    /// The style's job is to decide **how** those pieces are arranged
    /// and decorated.
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            // The label (title + icon) that the caller passes to `GroupBox`.
            //
            // Example call site:
            //   GroupBox {
            //       ...content...
            //   } label: {
            //       Label("Previously Playing", systemImage: "music.note")
            //   }
            //
            // That `Label` becomes `configuration.label` here.
            configuration.label
                .bold()
                .foregroundStyle(.pink)

            // The main content area of the group box.
            // In this demo, that's another `GroupBox` wrapping
            // `MusicPlayerView`, but it could be any view hierarchy.
            configuration.content
        }
        // Add some breathing room around the label + content.
        .padding()
        // Draw a rounded rectangle behind everything using
        // the system's blur/material effect so the card
        // stands out against the background.
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: 16)
        )
    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    /// Convenience accessor so callers can write `.groupBoxStyle(.music)`.
    ///
    /// Without this, you'd have to write
    /// `groupBoxStyle(MusicGroupBoxStyle())` at each call site.
    static var music: MusicGroupBoxStyle { .init() }
}
