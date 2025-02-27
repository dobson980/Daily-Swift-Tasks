//
//  User.swift
//  CustomViewWithDynamicData
//
//  Created by Thomas Dobson on 2/24/25.
//

import Foundation
import SwiftUI

// The User struct represents a user's data.
struct User: Identifiable {
    // A unique identifier for each user, automatically generated.
    var id = UUID()
    // The user's name as a String.
    var name: String
    // The user's email address as a String.
    var email: String
    // The name of the system icon associated with this user.
    var avatar: String
    // A computed property that generates a SwiftUI Image from the avatar name.
    var avatarIcon: Image {
        // The Image initializer uses the SF Symbol name provided by the `avatar` property.
        return Image(systemName: avatar)
    }
}
