//
//  Data.swift
//  FloatingSheets
//
//  Created by Thomas Dobson on 4/2/25.
//

import Foundation

struct Action:Identifiable {
    var id = UUID()
    var image: String
    var title: String
}

let actions: [Action] = [
        Action(image: "xbox.logo", title: "Game Pass"),
        Action(image: "playstation.logo", title: "PS Plus"),
        Action(image: "apple.logo", title: "iCloud +"),
        Action(image: "appletv.fill", title: "Apple TV")
]

struct Period: Identifiable {
    var id = UUID().uuidString
    var title: String
    var value: Int
}

let periods: [Period] = [
    Period(title: "1", value: 1),
    Period(title: "3", value: 3),
    Period(title: "5", value: 5),
    Period(title: "7", value: 7),
    Period(title: "9", value: 9),
    Period(title: "Custom", value: 0)
]

struct KeyPad: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var value: Int
    var isBack: Bool = false
}

let keypadValues: [KeyPad] = (1...9).compactMap(
    { KeyPad(title: String($0), value: $0) }
) + [KeyPad(title: "0", value: 0), KeyPad(title: "chevron.left", value: -1, isBack: true)]

