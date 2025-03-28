//
//  PushNotificationApp.swift
//  PushNotification
//
//  Created by Thomas Dobson on 3/27/25.
//

import SwiftUI

/**
 * PushNotification Application
 *
 * This file serves as the main entry point for the PushNotification application,
 * which demonstrates iOS push notification functionality. The app is structured using
 * SwiftUI's App protocol with an attached UIApplicationDelegate to handle the iOS
 * notification system integration.
 *
 * The implementation:
 * - Sets up the main SwiftUI application structure
 * - Configures a UIApplicationDelegate to handle notification-related callbacks
 * - Implements UNUserNotificationCenterDelegate to control notification presentation behavior
 * - Ensures notifications can be displayed when the app is in the foreground
 */

/// @main attribute identifies this struct as the entry point for the application
@main
struct PushNotificationApp: App {
    /**
     * Application delegate property
     *
     * Using the @UIApplicationDelegateAdaptor property wrapper to connect the SwiftUI
     * lifecycle with UIKit's UIApplicationDelegate lifecycle, allowing us to handle
     * notification-related callbacks that aren't directly exposed in SwiftUI.
     */
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    /**
     * The application's scene configuration
     *
     * Defines the window group containing ContentView as the main interface.
     * ContentView will show the notification settings and controls.
     */
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/**
 * AppDelegate
 *
 * Acts as the application delegate and notification delegate, handling:
 * 1. Application lifecycle events
 * 2. User notification center delegate responsibilities
 * 3. Configuration of notification behavior
 *
 * This class bridges between UIKit's delegate-based notification system and
 * our SwiftUI application, ensuring notifications work properly.
 */
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    /**
     * Application launch handler
     *
     * Called when the application finishes launching. This method:
     * - Acquires a reference to the shared notification center
     * - Sets this class as the notification center's delegate to handle
     *   notification presentation when the app is in the foreground
     *
     * - Parameters:
     *   - application: The singleton app instance
     *   - launchOptions: A dictionary indicating the reason the app was launched
     *
     * - Returns: `true` to indicate successful launching
     */
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let center = UNUserNotificationCenter.current()
        center.delegate = self // Set the delegate so notifications are shown in foreground
        return true
    }
    
    /**
     * Foreground notification presentation handler
     *
     * Controls how notifications are displayed when the app is in the foreground.
     * By default, iOS doesn't show notification banners when the app is active, but
     * this method overrides that behavior to present notifications even when the app
     * is being actively used.
     *
     * - Parameters:
     *   - center: The notification center requesting the presentation options
     *   - notification: The notification to be presented
     *   - completionHandler: A closure to execute with the presentation options
     *
     * Current configuration enables:
     * - Banner alerts (.banner) - Visual notification at top of screen
     * - Sound (.sound) - Audible notification alert
     * (Badge updates are not enabled in this configuration)
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // You can choose to show banners, play sounds, update badges, etc.
        completionHandler([.banner, .sound])
    }
}
