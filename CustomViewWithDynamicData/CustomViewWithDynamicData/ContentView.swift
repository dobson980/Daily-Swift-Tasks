//
//  ContentView.swift
//  CustomViewWithDynamicData
//
//  Created by Thomas Dobson on 2/24/25.
//

import SwiftUI

// The main ContentView of the app, responsible for displaying a scrollable list of users.
struct ContentView: View {
    
    // A list of sample User data to display in the UI.
    var users: [User] = [
        User(name: "Rick James", email: "Rick.James@yahoo.com", avatar: "guitars.fill"),
        User(name: "Jane Doe", email: "Jane.Doe@gmail.com", avatar: "arcade.stick.console.fill"),
        User(name: "Moe Mira", email: "mmira@gmail.com", avatar: "xbox.logo")
    ]
    
    var body: some View {
        // Displays a vertical scrolling view of UserView components for each User in the list.
        ScrollView {
            ForEach(users) { user in
                UserView(user: user)
            }
        }
        .padding() // Adds padding around the ScrollView for spacing.
    }
}

// A preview provider for Xcode’s canvas to see ContentView in action.
#Preview {
    ContentView()
}
