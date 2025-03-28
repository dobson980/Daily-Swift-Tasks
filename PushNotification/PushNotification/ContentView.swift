//
//  ContentView.swift
//  PushNotification
//
//  Created by Thomas Dobson on 3/27/25.
//

import SwiftUI
import UserNotifications

/**
 * ContentView - Main view controller for the Push Notification demonstration app
 *
 * This view serves as the primary interface for demonstrating iOS push notifications.
 * It displays the current notification permission status and settings in a visual format,
 * allows users to request permissions if needed, and provides functionality to send test
 * notifications and access system notification settings.
 *
 * The view automatically refreshes notification settings when it appears and when the app
 * returns to the foreground, ensuring that the displayed information is always current.
 */
struct ContentView: View {
    /// Stores the current notification settings retrieved from the system
    @State private var notificationSettings: UNNotificationSettings?
    
    /// Scene phase environment value to detect when app becomes active
    @Environment(\.scenePhase) private var scenePhase
    
    /// Main view body that constructs the UI
    var body: some View {
        VStack {
            // App title
            Text("Push Notifications!")
                .font(.system(size: 40))
            
            Spacer()
            
            // Conditional rendering based on whether notification settings are available
            if let notificationSettings = notificationSettings {
                // Display various notification permission settings using custom views
                // Each setting shows its current status and uses color coding for quick visual reference
                
                // Authorization status (overall permission status)
                AuthorizationStatusView(
                    settingText: "Authorization Status: ",
                    descriptionText: notificationSettings.authorizationStatus.description,
                    settingColor: notificationSettings.authorizationStatus.color
                )
                
                // Display individual notification capabilities and their current status
                SettingView(
                    settingText: "Alert Setting",
                    descriptionText: notificationSettings.alertSetting.description,
                    settingColor: notificationSettings.alertSetting.color
                )
                SettingView(
                    settingText: "Badge Setting",
                    descriptionText: notificationSettings.badgeSetting.description,
                    settingColor: notificationSettings.badgeSetting.color
                )
                SettingView(
                    settingText: "Sound Setting",
                    descriptionText: notificationSettings.soundSetting.description,
                    settingColor: notificationSettings.soundSetting.color
                )
                SettingView(
                    settingText: "Lockscreen Setting",
                    descriptionText: notificationSettings.lockScreenSetting.description,
                    settingColor: notificationSettings.lockScreenSetting.color
                )
                SettingView(
                    settingText: "Notification Center Setting",
                    descriptionText: notificationSettings.notificationCenterSetting.description,
                    settingColor: notificationSettings.notificationCenterSetting.color
                )
                SettingView(
                    settingText: "Car Play Setting",
                    descriptionText: notificationSettings.carPlaySetting.description,
                    settingColor: notificationSettings.carPlaySetting.color
                )
                SettingView(
                    settingText: "Time Sensitive Setting",
                    descriptionText: notificationSettings.timeSensitiveSetting.description,
                    settingColor: notificationSettings.timeSensitiveSetting.color
                )
                SettingView(
                    settingText: "Announcement Setting",
                    descriptionText: notificationSettings.announcementSetting.description,
                    settingColor: notificationSettings.announcementSetting.color
                )
                SettingView(
                    settingText: "Scheduled Delivery Setting",
                    descriptionText: notificationSettings.scheduledDeliverySetting.description,
                    settingColor: notificationSettings.scheduledDeliverySetting.color
                )
                SettingView(
                    settingText: "Critical Alert Setting",
                    descriptionText: notificationSettings.criticalAlertSetting.description,
                    settingColor: notificationSettings.criticalAlertSetting.color
                )
                
                Spacer()
                
                // Interactive buttons for testing and configuration
                Button("Notify Me!") {
                    pushNotification()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Open Notification Settings") {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        // View lifecycle handlers
        .onAppear() {
            // Initialize by checking current permissions and requesting if needed
            checkNotificationPermissions()
            requestNotificationPermission()
        }
        .onChange(of: scenePhase) {
            // Refresh notification settings when app becomes active
            checkNotificationPermissions()
        }
        .padding()
    }
    
    /**
     * Retrieves and updates the current notification permission settings
     *
     * This method queries the UNUserNotificationCenter for the current notification settings
     * and updates the notificationSettings state variable if permissions are granted.
     * Uses Swift's async/await pattern to handle the asynchronous notification center API.
     */
    func checkNotificationPermissions() {
        let center = UNUserNotificationCenter.current()
        
        Task {
            let settings = await center.notificationSettings()
            
            // Only update UI if user has granted some form of notification permission
            guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional else { return
            }
            notificationSettings = settings
        }
    }
    
    /**
     * Requests notification permissions from the user
     *
     * This method prompts the user with a system dialog to grant notification permissions.
     * It requests authorization for alerts, badges, and sounds - the standard notification types.
     * After the user responds to the permission prompt, it logs the result and refreshes
     * the notification settings display.
     */
    func requestNotificationPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        Task {
            do {
                let granted = try await notificationCenter.requestAuthorization(
                    options: [.alert, .badge, .sound]
                )
                if granted {
                    print("User granted notifications")
                } else {
                    print("User denied notifications")
                }
                // Refresh displayed settings after permission request
                checkNotificationPermissions()
            } catch {
                print("Error requesting notifications: \(error.localizedDescription)")
            }
        }
    }
    
    /**
     * Schedules and sends a test local notification
     *
     * This method creates and schedules a local notification with the following characteristics:
     * - Title: "Hello, There!"
     * - Body: "This is a native push notification!"
     * - Custom sound: "rupee.wav" (must be included in the app bundle)
     * - Trigger: Time-based trigger that fires after 3 seconds
     * - Unique identifier: Generated UUID to avoid duplicate notifications
     *
     * The notification will appear even if the app is in the foreground due to the
     * UNUserNotificationCenterDelegate implementation in AppDelegate.
     */
    func pushNotification() {
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Hello, There!"
        content.body = "This is a native push notification!"
        content.sound = UNNotificationSound(named: UNNotificationSoundName("rupee.wav"))
        
        // Configure time-based trigger (3 seconds delay)
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 3,
            repeats: false
        )
        
        // Create a unique identifier for this notification
        let uniqueID = UUID().uuidString
        
        // Combine content and trigger into a notification request
        let request = UNNotificationRequest(
            identifier: uniqueID,
            content: content,
            trigger: trigger
        )
        
        // Schedule the notification
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}

#Preview {
    ContentView()
}
