//
//  NotificationSettingsDescriptors.swift
//  PushNotification
//
//  Created by Thomas Dobson on 3/27/25.
//

import Foundation
import UserNotifications
import SwiftUI

/**
 * Extensions for User Notification Settings Types
 *
 * This file provides extensions to the UserNotifications framework types to make them
 * more user-friendly and visually informative in the UI. Specifically:
 *
 * - Adds human-readable text descriptions for notification authorization statuses
 * - Adds human-readable text descriptions for notification setting options
 * - Provides semantic color coding for both authorization statuses and settings
 *   to visually indicate their state (green for enabled/authorized, red for disabled/denied)
 *
 * These extensions support the app's notification settings display UI, making
 * the technical notification states more accessible to users.
 */

/// Extends UNAuthorizationStatus to provide human-readable text descriptions
/// for each possible notification authorization state
extension UNAuthorizationStatus {
    /**
     * Returns a user-friendly string description of the authorization status
     *
     * - Returns: A string representing the current notification authorization status:
     *   - "Not Determined": User has not yet made a choice
     *   - "Denied": User has explicitly denied notification permissions
     *   - "Authorized": User has granted full notification permissions
     *   - "Provisional": User has granted provisional permission (quiet notifications)
     *   - "Ephemeral": Temporary authorization for app clips
     *   - "Unknown": For future OS values not covered by current implementation
     */
    var description: String {
        switch self {
        case .notDetermined:
            return "Not Determined"
        case .denied:
            return "Denied"
        case .authorized:
            return "Authorized"
        case .provisional:
            return "Provisional"
        case .ephemeral:
            return "Ephemeral"
        @unknown default:
            // Fallback for future iOS versions that might introduce new status values
            return "Unknown"
        }
    }
}

/// Extends UNNotificationSetting to provide human-readable text descriptions
/// for each possible notification setting state
extension UNNotificationSetting {
    /**
     * Returns a user-friendly string description of the notification setting
     *
     * This is used for various notification capabilities like alerts, sounds, badges, etc.
     *
     * - Returns: A string representing the current setting state:
     *   - "Not Supported": The device or system doesn't support this notification feature
     *   - "Disabled": Feature is supported but currently turned off
     *   - "Enabled": Feature is supported and currently turned on
     *   - "Unknown": For future OS values not covered by current implementation
     */
    var description: String {
        switch self {
        case .notSupported:
            return "Not Supported"
        case .disabled:
            return "Disabled"
        case .enabled:
            return "Enabled"
        @unknown default:
            // Fallback for future iOS versions that might introduce new setting values
            return "Unknown"
        }
    }
}

/// Extends UNNotificationSetting to provide semantic color coding based on setting state
extension UNNotificationSetting {
    /**
     * Returns an appropriate SwiftUI Color based on the notification setting's state
     *
     * This property enables visual indication of setting states in the UI:
     * - Green for enabled settings (positive)
     * - Red for disabled settings (negative/attention needed)
     * - Gray for unsupported settings (neutral/informational)
     *
     * - Returns: A SwiftUI Color appropriate for the current setting:
     *   - .green: Setting is enabled
     *   - .red: Setting is disabled
     *   - .gray: Setting is not supported
     *   - .primary: Fallback for unknown future states
     */
    var color: Color {
        switch self {
        case .enabled:
            return .green
        case .disabled:
            return .red
        case .notSupported:
            return .gray
        @unknown default:
            // Fallback for future iOS versions that might introduce new setting values
            return .primary
        }
    }
}

/// Extends UNAuthorizationStatus to provide semantic color coding based on authorization state
extension UNAuthorizationStatus {
    /**
     * Returns an appropriate SwiftUI Color based on the authorization status
     *
     * This property enables visual indication of permission states in the UI:
     * - Green for authorized statuses (positive)
     * - Red for denied or undetermined statuses (negative/attention needed)
     *
     * - Returns: A SwiftUI Color appropriate for the current authorization status:
     *   - .green: For authorized, provisional, or ephemeral status (permission granted)
     *   - .red: For denied or not determined status (action needed)
     *   - .primary: Fallback for unknown future statuses
     */
    var color: Color {
        switch self {
        case .authorized, .provisional, .ephemeral:
            return .green
        case .denied, .notDetermined:
            return .red
        @unknown default:
            // Fallback for future iOS versions that might introduce new status values
            return .primary
        }
    }
}
