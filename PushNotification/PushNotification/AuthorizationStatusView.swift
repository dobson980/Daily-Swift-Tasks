//
//  SettingView.swift
//  PushNotification
//
//  Created by Thomas Dobson on 3/27/25.
//

import SwiftUI
import UserNotifications
struct AuthorizationStatusView: View {
    let settingText: String
    let descriptionText: String
    let settingColor: Color
    
    var body: some View {
        (
            Text("**\(settingText)**") + Text(descriptionText).foregroundColor(settingColor)
        )
    }
}

#Preview {
    let settingText = "Authorization Status: "
    let descriptionText = "Enabled"
    let settingColor = Color.green
    SettingView(settingText: settingText, descriptionText: descriptionText, settingColor: settingColor)
        
}
