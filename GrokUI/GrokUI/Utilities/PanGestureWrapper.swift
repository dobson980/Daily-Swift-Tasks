//
//  PanGestureWrapper.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// A small UIKit bridge that exposes a `UIPanGestureRecognizer` to SwiftUI.
///
/// SwiftUI's built-in `DragGesture` is great for most interactions, but sometimes
/// you want lower-level access to UIKit recognizers (for example, to configure
/// number of touches, direction, or gesture failure requirements).
///
/// `ContentView` uses this wrapper to track a two-finger pan that controls the
/// opening and closing of the sidebar.
struct PanGestureWrapper: UIGestureRecognizerRepresentable {
    /// Closure called whenever the underlying `UIPanGestureRecognizer` changes.
    var handle: (UIPanGestureRecognizer) -> ()

    func makeUIGestureRecognizer(context: Context) -> UIPanGestureRecognizer {
        let gesture = UIPanGestureRecognizer()
        // All configuration for the gesture (for example, numberOfTouchesRequired)
        // can be done here if you want to customize the interaction.
        return gesture
    }

    func updateUIGestureRecognizer(_ recognizer: UIPanGestureRecognizer, context: Context) {
        // No dynamic updates for this demo. In a real app you might tweak
        // `isEnabled` or other properties in response to SwiftUI state.
    }

    func handleUIGestureRecognizerAction(_ recognizer: UIPanGestureRecognizer, context: Context) {
        // Forward the recognizer so the SwiftUI view can inspect translation,
        // velocity, and state (began/changed/ended).
        handle(recognizer)
    }
}
