//
//  Data.swift
//  FloatingSheets
//
//  Created by Thomas Dobson on 4/2/25.
//

import Foundation

/// A model representing an action with an associated image and title.
/// Conforms to the Identifiable protocol for use in SwiftUI lists.
struct Action: Identifiable {
    /// A unique identifier for the action.
    var id = UUID()
    /// The system image name associated with the action.
    var image: String
    /// The title of the action.
    var title: String
}

/// A collection of sample actions available in the application.
let actions: [Action] = [
    Action(image: "xbox.logo", title: "Game Pass"),
    Action(image: "playstation.logo", title: "PS Plus"),
    Action(image: "apple.logo", title: "iCloud +"),
    Action(image: "appletv.fill", title: "Apple TV")
]

/// A model representing a period option with a title and associated numeric value.
/// Conforms to the Identifiable protocol for use in SwiftUI lists.
struct Period: Identifiable {
    /// A unique identifier generated as a String.
    var id = UUID().uuidString
    /// The display title for the period.
    var title: String
    /// The numeric value that the period represents.
    var value: Int
}

/// A collection of predefined period options available in the application.
let periods: [Period] = [
    Period(title: "1", value: 1),
    Period(title: "3", value: 3),
    Period(title: "5", value: 5),
    Period(title: "7", value: 7),
    Period(title: "9", value: 9),
    Period(title: "Custom", value: 0)
]

/// A model representing a keypad button with a title, a numeric value, and an optional backspace flag.
/// Conforms to the Identifiable protocol for use in SwiftUI lists.
struct KeyPad: Identifiable {
    /// A unique identifier for the keypad button.
    var id: String = UUID().uuidString
    /// The display title for the keypad button.
    var title: String
    /// The numeric value of the keypad button.
    var value: Int
    /// A flag indicating whether this keypad button represents a backspace action.
    var isBack: Bool = false
}

/// A collection of keypad buttons including numbers 1 through 9, 0, and a backspace arrow.
/// The backspace button is indicated by the isBack flag.
let keypadValues: [KeyPad] = (1...9).compactMap(
    { KeyPad(title: String($0), value: $0) }
) + [KeyPad(title: "0", value: 0), KeyPad(title: "chevron.left", value: -1, isBack: true)]
