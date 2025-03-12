//
//  CustomSideBar.swift
//  SideBar
//
//  Created by Thomas Dobson on 3/11/25.
//

import SwiftUI

// CustomSideBar is a reusable sidebar view that slides in/out from the left.
// It uses a binding variable (isPresented) to control its visibility.
struct CustomSideBar: View {
    // Binding for the sidebar's visibility; when true, the sidebar is shown.
    @Binding var isPresented: Bool

    var body: some View {
        // HStack arranges its children horizontally.
        // Here, it is used to position the sidebar on the left and push remaining space to the right.
        HStack {
            // ZStack overlays views on top of each other.
            // This ZStack contains the sidebar background and its menu items.
            ZStack {
                // RoundedRectangle serves as the background "track" for the sidebar.
                // The corner radius gives it rounded edges.
                RoundedRectangle(cornerRadius: 5)
                    // The frame is set with a fixed width (125 points) and left alignment.
                    .frame(width: 125, alignment: .leading)
                    // foregroundStyle is set to a soft system color, making the background gentle.
                    .foregroundStyle(Color(.systemGray6))
                    // ignoresSafeArea makes the sidebar extend the full height of the view.
                    .ignoresSafeArea()
                
                // VStack arranges the menu items vertically within the sidebar.
                VStack(spacing: 10) {
                    // "Menu" title styled as a bold, large title.
                    Text("Menu")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 5) // Extra spacing below the title.
                    
                    // Additional menu items.
                    Text("Contacts")
                    Text("Calendar")
                    
                    // Spacer pushes the subsequent content to the bottom of the sidebar.
                    Spacer()
                    
                    // "Settings" is displayed at the bottom, emphasized with bold text.
                    Text("Settings")
                        .fontWeight(.bold)
                }
            }
            // Spacer in the HStack pushes the sidebar to the left.
            Spacer()
        }
        // The offset modifier shifts the sidebar horizontally.
        // When isPresented is true, offset is 0 (sidebar visible); when false, it moves left off-screen (-125).
        .offset(x: isPresented ? 0 : -125)
        // The animation modifier animates changes to isPresented using an easeInOut curve over 0.4 seconds.
        .animation(.easeInOut(duration: 0.4), value: isPresented)
    }
}

// Preview section using the new @Previewable macro.
// A local @State variable (sideBarVisible) is declared to make the preview interactive.
#Preview {
    @Previewable @State var sideBarVisible = true
    // The binding is passed to CustomSideBar so that toggling sideBarVisible updates the view.
    CustomSideBar(isPresented: $sideBarVisible)
}
