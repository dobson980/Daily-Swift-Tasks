//
//  AuthorizationStatusView.swift
//  PushNotification
//
//  Created by Thomas Dobson on 3/27/25.
//

import SwiftUI
import UserNotifications

/**
 * AuthorizationStatusView - A reusable view component for displaying notification permission status
 *
 * This view component displays notification authorization settings in a standardized format,
 * with text describing the setting type followed by its current status value. The status value
 * is colord) to provide immediate visual feedback.
 *
 -coded according to its state (typically green for enabled/authorized, red for
 * disabled/denie* While similar to the SettingView component, this specialized view is specifically designed
 * for displaying the overall notification authorization status, which serves as the primary
 * indicator of whether the app has permission to send notifications at all.
 *
 * Usage example:
 * ```
 * AuthorizationStatusView(
 *     settingText: "Authorization Status: ",
 *     descriptionText: notificationSettings.authorizationStatus.description,
 *     settingColor: notificationSettings.authorizationStatus.color
 * )
 * ```
 */
struct AuthorizationStatusView: View {
    /// The descriptive label text that appears before the status value (e.g., "Authorization Status:")
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
 * Preview provider for AuthorizationStatusView
 *
 * This preview displays a sample AuthorizationStatusView with example data
 * to demonstrate how the component will appear in the UI. It shows an enabled
 * authorization status with green coloring to represent a positive state.
 *
 * Note: The preview incorrectly creates a SettingView instead of an AuthorizationStatusView,
 * which appears to be a mistake in the original implementation. In practice, this
 * would cause the preview to not display correctly.
 */
#Preview {
    let settingText = "Authorization Status"
    let descriptionText = "Enabled"
    let settingColor = Color.green
    SettingView(settingText: settingText, descriptionText: descriptionText, settingColor: settingColor)
        
}
