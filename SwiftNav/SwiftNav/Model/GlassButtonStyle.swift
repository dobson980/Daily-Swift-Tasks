//
//  Glass.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import Foundation

/// High-level style options for the glass buttons used in this demo.
///
/// This keeps view code expressive ("none", "glass", "glassProminent")
/// instead of scattering specific `ButtonStyle` values everywhere.
enum GlassButtonStyle {
    /// Regular button without any glass treatment.
    case none
    /// Subtle glass effect.
    case glass
    /// Stronger, more attention-grabbing glass effect.
    case glassProminent
}
