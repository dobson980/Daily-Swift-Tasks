//
//  DadsPreferenceKey.swift
//  PreferenceKeys
//
//  Created by Thomas Dobson on 2/24/25.
//

import Foundation
import SwiftUI

// The custom preference key is defined as a struct conforming to the PreferenceKey protocol.
// This allows you to send data "up" the view hierarchy in SwiftUI.
struct DadsPreferenceKey: PreferenceKey {
    // A default value must be provided. This is what the parent view will see
    // if no child views set a preference for this key.
    static var defaultValue: String = "Default Value"
    
    // The reduce function specifies how to handle multiple values for this key.
    // In this case, we're simply replacing the existing value with the new one.
    // You could customize this to combine values or handle more complex logic.
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

// This extension on View makes it easy to apply the preference key.
// By calling `updateDadsPreferenceKey(with:)` on a view, you can set a new value
// for the DadsPreferenceKey and allow parent views to react to that value.
extension View {
    // This is a convenience method that applies the preference modifier.
    // It sets a new value for the DadsPreferenceKey, making it available
    // to parent views that listen for changes.
    func updateDadsPreferenceKey(with value: String) -> some View {
        self.preference(key: DadsPreferenceKey.self, value: value)
    }
}
