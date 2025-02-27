//
//  UserView.swift
//  CustomViewWithDynamicData
//
//  Created by Thomas Dobson on 2/24/25.
//

import SwiftUI

// UserView is a reusable SwiftUI component that displays user details.
struct UserView: View {
    // A User object that contains the data (name, email, and avatar) needed for the view.
    var user: User
    
    var body: some View {
        // A vertical stack to arrange content elements (avatar, name, email) vertically with consistent spacing.
        VStack(spacing: 16) {
            // Display the user's avatar icon. This is drawn from the system image name specified in `user.avatarIcon`.
            // The font size, weight, and design give it a modern, bold appearance.
            user.avatarIcon
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.top, 16)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            
            // Display the user's name as a headline-style text, using white as the text color.
            Text(user.name)
                .font(.headline)
                .foregroundColor(.white)
            
            // Display the user's email as a subheadline-style text, also using white as the text color.
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(20) // Adds padding around the VStack for better spacing.
        .background(
            // Uses a rounded rectangle as a background for the view, with a shadow for a subtle 3D effect.
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(Color.accentColor))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                .frame(minWidth: 250) // Ensures a minimum width for the rounded rectangle background.
        )
        .frame(minWidth: 250) // Ensures the entire UserView has a minimum width.
    }
}

// This is an Xcode preview that displays a UserView in the preview canvas.
// It shows what the UserView will look like with a sample user.
#Preview {
    UserView(user: User(name: "Jane Dog", email: "Jane.Dog@gmail.com", avatar: "xbox.logo"))
}
