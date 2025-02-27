//
//  DadsKey.swift
//  EnvirornmentKeys
//
//  Created by Thomas Dobson on 2/23/25.
//

import Foundation
import SwiftUI

// This struct conforms to the EnvironmentKey protocol, which lets us define a default value
// for our custom environment key.
struct DadsKey: EnvironmentKey {
    // The default value of our custom environment key. This will be used if
    // no explicit value is set via a View modifier.
    static let defaultValue: String = "dad123"
}

// Here, we extend the EnvironmentValues struct to include our new environment key.
// This allows us to use `EnvironmentValues.dadsKey` to get or set the custom value.
extension EnvironmentValues {
    // We define a computed property, `dadsKey`, that retrieves the value associated
    // with our custom environment key. If nothing has been set, it returns the default value.
    var dadsKey: String {
        get { self[DadsKey.self] }
        set { self[DadsKey.self] = newValue }
    }
}

// This extension on View provides a convenient modifier method, `dadsKey(_:)`,
// which makes it easy to set a new value for our custom environment key.
// Using this modifier, you can just call `.dadsKey("value")` on any View.
extension View {
    // A public method that applies the environment value for `dadsKey`.
    public func dadsKey(_ dadsKey: String) -> some View {
        environment(\.dadsKey, dadsKey)
    }
}
