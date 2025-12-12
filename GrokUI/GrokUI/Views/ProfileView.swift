//
//  ProfileView.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Placeholder profile screen rendered when `AvailableViews.profile` is active.
///
/// Keeping these additional screens simple helps keep the focus of the demo on
/// the sidebar layout and gesture mechanics.
struct ProfileView: View {
   
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Text("This is the Profile View")
                .font(.title)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
       
    }
}

#Preview {
    ProfileView()
}
