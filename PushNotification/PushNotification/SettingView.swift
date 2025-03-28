//
//  SettingView.swift
//  PushNotification
//
//  Created by Thomas Dobson on 3/27/25.
//

import SwiftUI
import UserNotifications

/**
 * SettingView - A reusable view component for displaying notification settings
 *
 * This SwiftUI view component creates a standardized format for displaying various
 * notification settings, with each setting comprising:
 * - A descriptive label text (what the setting controls)
 * - The setting's current value/status
 * - Color-coded visual indication of the setting's state
 *
 * It's designed to be reused across multiple notification settings (alerts, badges, sounds, etc.)
 * to maintain a consistent appearance throughout the app. The component handles the visual
 * formatting while receiving the actual setting values and appropriate colors from its parent.
 *
 * Usage example:
 * ```
 * SettingView(
 *     settingText: "Alert Setting",
 *     descriptionText: notificationSettings.alertSetting.description,
 *     settingColor: notificationSettings.alertSetting.color
 * )
 * ```
 */
struct SettingView: View {
    /// The descriptive label text that appears before the status value (e.g., "Alert Setting")
    let settingText: String
    
    /// The current value of the setting, typically derived from UNNotificationSettings properties
    /// via extension properties that provide human-readable descriptions
    let descriptionText: String
    
    /// The color used to visually indicate the setting state (green for enabled, red for disabled, etc.)
    /// Typically derived from extension properties on UNNotificationSettings that provide semantic colors
    let settingColor: Color
    
    /**
     * Constructs the view's body, combining the setting label and status value
     *
     * The view creates a composite text view where:
     * - The setting label (settingText) is displayed in bold
     * - The description text (descriptionText) is displayed in the specified semantic color
     * - Both texts are combined into a single line
     *
     * This approach allows for consistent styling across all notification setting displays
     * while enabling different colors for different status values.
     */
    var body: some View {
        (
            Text("**\(settingText):** ") + Text(descriptionText).foregroundColor(settingColor)
        )
    }
}

/**
 * Preview provider for SettingView
 *
 * This preview displays a sample SettingView with example data to demonstrate how
 * the component will appear in the UI. It shows an "Authorization Status" setting
 * with an "Enabled" value displayed in green to represent a positive state.
 *
 * In the actual app, this component would be populated with real notification settings
 * data from UNUserNotificationCenter.
 */
#Preview {
    let settingText = "Authorization Status"
    let descriptionText = "Enabled"
    let settingColor = Color.green
    SettingView(settingText: settingText, descriptionText: descriptionText, settingColor: settingColor)
        
}
