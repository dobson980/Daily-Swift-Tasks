//
//  SubscriptionViewModel.swift
//  FloatingSheets
//
//  Created by Thomas Dobson on 4/3/25.
//

import Foundation

/// A view model that manages subscription data and related state for the FloatingSheets application.
///
/// The SubscriptionViewModel is responsible for tracking subscription-related properties such as the 
/// current view, subscription status, selected action, selected period, and additional duration information.
/// It computes whether a subscription is active and calculates the remaining subscription days.
@Observable
class SubscriptionViewModel: ObservableObject {
    
    /// A Boolean flag indicating whether certain UI elements (e.g., subscription details) should be shown.
    var show: Bool = false
    
    /// The current view state in the subscription workflow.
    var currentView: CurrentView = .actions
    
    /// The currently selected subscriber action, if any.
    var selectedAction: Action?
    
    /// The currently selected period option, if any.
    var selectedPeriod: Period?
    
    /// A string representing the custom duration input by the user.
    var duration: String = ""
            
    /// A computed property that determines if the user is subscribed.
    ///
    /// The subscription is considered active if:
    /// - Both a selectedAction and a selectedPeriod are set, or
    /// - A selectedAction is set and a custom duration has been provided.
    var isSubscribed: Bool {
        if selectedAction != nil && selectedPeriod != nil {
            return true
        }
        if selectedAction != nil && !duration.isEmpty {
            return true
        }
        return false
    }
    
    /// A computed property that calculates the number of subscription days remaining.
    ///
    /// If a period is selected, the remaining days are calculated by multiplying the period's value by 12.
    /// Otherwise, if a custom duration is provided, it attempts to convert the duration string to an integer.
    /// If neither is available or the conversion fails, it returns 0.
    var subscrptionDaysRemaining: Int {
        if let selectedPeriod = selectedPeriod {
            return selectedPeriod.value * 12
        } else {
            return duration.isEmpty ? 0 : Int(duration) ?? 0
        }
    }
    
}
