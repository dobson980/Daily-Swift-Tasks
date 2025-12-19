//
//  SettingsScreen.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

import SwiftUI

/// Demonstrates how `@AppStorage` keeps SwiftUI forms synced with `UserDefaults` without extra wiring.
struct SettingsScreen: View {
   
    /// Preferred appearance persisted across launches and mirrored by the `setAppearanceTheme()` view modifier.
    @AppStorage(UserDefaultsKeys.appearanceTheme)
    private var appearanceTheme: AppearanceTheme = .system
    
    /// Lightweight profile field to show how text inputs bind to stored values.
    @AppStorage(UserDefaultsKeys.username)
    private var username: String = ""
    
    /// Arbitrary preference for demonstrating numeric bindings (Stepper).
    @AppStorage(UserDefaultsKeys.itemsPerPage)
    private var itemsPerPage: Int = 20
    
    /// Toggle example that integrates with persisted boolean settings.
    @AppStorage(UserDefaultsKeys.notificationsEnabled)
    private var notificationsEnabled: Bool = true

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Appearance", selection: $appearanceTheme) {
                        ForEach(AppearanceTheme.allCases) { theme in
                            Text(theme.rawValue.capitalized)
                                .tag(theme)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                } header: {
                    Text("Appearance")
                } footer: {
                    Text("Overrides the system appearance to always use Light.")
                }
                
                Section("Account") {
                    TextField("Username", text: $username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                
                Section("Preferences") {
                    Stepper("Items per page: \(itemsPerPage)", value: $itemsPerPage, in: 10...100, step: 5)
                    Toggle("Enable notifications", isOn: $notificationsEnabled)
                }
                
                Section {
                    Button(role: .destructive) {
                        resetDefaults()
                    } label: {
                        Text("Reset to Defaults")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }

    /// Resets every bound preference, giving learners a quick way to return to the baseline state.
    private func resetDefaults() {
        appearanceTheme = .system
        username = ""
        itemsPerPage = 20
        notificationsEnabled = true
    }
}

//MARK: - data model for appearance

/// Enumerates the supported appearance override values and doubles as the data source for `Picker`.
enum AppearanceTheme: String, Identifiable, CaseIterable {
    case system
    case light
    case dark
    var id: Self { return self }
}

//MARK: - helper to save user defaults keys and keep them unique

/// Type-safe namespace for `UserDefaults` keys so typo mistakes show up at compile time.
enum UserDefaultsKeys {
    static let appearanceTheme = "appearanceTheme"
    static let username = "username"
    static let itemsPerPage = "itemsPerPage"
    static let notificationsEnabled = "notificationsEnabled"
}

//MARK: - helper to set saved theme

extension View {
    /// Applies a modifier that reads `appearanceTheme` from storage and updates `preferredColorScheme` accordingly.
    func setAppearanceTheme() -> some View {
        modifier(AppearanceThemeViewModifier())
    }
}


/// View modifier that mirrors the settings selection globally.
struct AppearanceThemeViewModifier: ViewModifier {
    
    @AppStorage(UserDefaultsKeys.appearanceTheme) private var appearanceTheme: AppearanceTheme = .system
    
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(scheme())
    }
    
    /// Converts the custom enum into the optional `ColorScheme` SwiftUI expects.
    func scheme() -> ColorScheme? {
        switch appearanceTheme {
            case .dark: return .dark
            case .light: return .light
            case .system: return nil
        }
    }
}

//MARK: - Preview

// Preview lets you toggle each setting without affecting real user defaults in Debug builds.
#Preview {
    NavigationStack {
        SettingsScreen()
    }
}
