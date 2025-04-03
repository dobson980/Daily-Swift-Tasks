import SwiftUI

/// \file TrayHelper.swift
/// \brief Contains advanced helper structures and extensions for the custom tray sheet.
///
/// This file defines configuration and view helpers that allow any SwiftUI view to easily present a customizable tray sheet
/// using advanced presentation techniques. This includes custom configurations for corner radius, detents, padding,
/// and shadow removal for a seamless user interface experience.

// MARK: - TrayConfig

/// \struct TrayConfig
/// \brief Holds all configuration properties for the tray sheet.
///
/// This configuration struct defines various parameters that control how the tray sheet is presented.
/// It includes options for presentation detents, corner radius, interactive dismissal, and padding values.
struct TrayConfig {
    /// Defines the maximum presentation detent for the sheet.
    /// A detent represents a specified height (or fraction of the screen) for the snackbar/tray.
    var maxDetent: PresentationDetent
    /// Sets the radius of the tray's rounded corners.
    var cornerRadius: CGFloat = 30
    /// Determines if the tray can be dismissed interactively.
    /// When set to true, interactive dismissal is disabled.
    var isInteractiveDismissDisabled: Bool = false
    
    /// Specifies the horizontal padding for the tray content.
    var horizontalPadding: CGFloat = 15
    /// Specifies the bottom padding for the tray content.
    var bomttomPadding: CGFloat = 15
}

// MARK: - View Extension for System Tray

/// Extension that adds an advanced utility for presenting a tray sheet.
///
/// This extension on `View` provides a method `systemTrayView` for presenting a sheet as a tray with advanced styling,
/// custom padding, detents, and interactive dismissal control.
extension View {
    /**
     Presents a system tray sheet when the binding `show` is set to true.
     
     The tray's appearance and behavior are customized using the provided `TrayConfig`. The content of the tray is built
     using the view builder closure. This extension applies multiple SwiftUI modifiers to ensure the tray sheet is styled
     correctly, including setting background color, clipping to a rounded rectangle, and configuring presentation details.
     
     - Parameter show: A binding that controls whether the tray sheet is presented.
     - Parameter config: An instance of `TrayConfig` that holds configuration options. Defaults to a nearly full-screen sheet.
     - Parameter content: A view builder closure that constructs the content displayed inside the tray.
     
     - Returns: A view that, when `show` is true, presents a styled tray sheet with the provided configuration.
     
     The method applies the following modifiers:
       - `background`: Uses the system background color.
       - `clipShape`: Clips the tray content into a rounded rectangle using `config.cornerRadius`.
       - `padding`: Applies horizontal and bottom padding as defined in `config`.
       - `frame`: Sets the view to take the maximum height and aligns it to the bottom.
       - `presentationDetents`: Limits the tray size based on `config.maxDetent`.
       - `presentationCornerRadius`: Customizes the presentation container's corner radius.
       - `presentationBackground`: Sets the presentation container's background to transparent.
       - `presentationDragIndicator`: Hides the default drag indicator.
       - `interactiveDismissDisabled`: Controls whether interactive dismissal is allowed based on `config`.
     */
    @ViewBuilder
    func systemTrayView<Content: View>(
        _ show: Binding<Bool>,
        config: TrayConfig = TrayConfig(maxDetent: .fraction(0.99)),
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        // Present a sheet when `show` is true.
        self
            .sheet(isPresented: show) {
                // Build and style the tray sheet content.
                content()
                    .background(.background) // Match system's background color.
                    .clipShape(.rect(cornerRadius: config.cornerRadius)) // Use a rounded rectangle with a custom corner radius.
                    .padding(.horizontal, config.horizontalPadding) // Apply horizontal padding as defined in config.
                    .padding(.bottom, config.bomttomPadding) // Apply bottom padding as defined in config.
                    .frame(maxHeight: .infinity, alignment: .bottom) // Stretch to available height, aligned at the bottom.
                    .presentationDetents([config.maxDetent]) // Restrict sheet's size to the specified detent.
                    .presentationCornerRadius(0) // Override default container corner radius (custom styling provided by clipShape).
                    .presentationBackground(.clear) // Ensure a transparent presentation background.
                    .presentationDragIndicator(.hidden) // Hide the presentation drag indicator.
                    .interactiveDismissDisabled(config.isInteractiveDismissDisabled) // Enable or disable interactive dismissal.
                    .background(RemoveSheetShadow()) // Extra background modifier (if further customization is needed).
            }
    }
}

// MARK: - Remove Sheet Shadow Helper

/// \struct RemoveSheetShadow
/// \brief A helper view to remove shadow effects from the tray sheet.
///
/// This helper uses the UIViewRepresentable protocol to integrate UIKit code for removing shadows from the tray's drop shadow view.
/// It schedules a task in Swift concurrency to asynchronously update the underlying UIKit view.
fileprivate struct RemoveSheetShadow: UIViewRepresentable {
    /**
     Creates the UIKit view that will be used in SwiftUI.
     
     - Parameter context: The context provided by SwiftUI.
     - Returns: A `UIView` with shadow color cleared.
     
     The method uses a `Task` to asynchronously search and clear the shadow view's shadow color by accessing the UIKit view hierarchy.
     */
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        Task {
            // Clear the shadow by accessing the UIView's dropShadowView if available.
            if let shadowView = view.dropShadowView {
                shadowView.layer.shadowColor = UIColor.clear.cgColor
            }
        }
        
        return view
    }
    
    /**
     Updates the UIKit view; required by UIViewRepresentable.
     
     - Parameters:
        - uiView: The view being updated.
        - context: The context that contains SwiftUI state.
     
     No additional updates are performed currently.
     */
    func updateUIView(_ uiView: UIView, context: Context) {
        // No dynamic updates needed for this view.
    }
}

// MARK: - UIView Extension for Drop Shadow Detection

/// Extension that recursively checks for and returns the drop shadow view from a UIView’s superviews.
///
/// The computed property `dropShadowView` checks if a view’s immediate superview is of type UIDropShadowView.
/// If not, it calls the same property on the superview recursively.
extension UIView {
    /// Computed property that retrieves the drop shadow view if present.
    var dropShadowView: UIView? {
        if let superview, String(describing: type(of: superview)) == "UIDropShadowView" {
            return superview
        }
        
        return superview?.dropShadowView
    }
}
