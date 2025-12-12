//
//  ContentView.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Main container for the **GrokUI** layout.
///
/// This view coordinates three key pieces:
/// - The sidebar menu (profile/settings/history/etc.).
/// - The primary content area (chat and simple placeholder screens).
/// - The custom two-finger pan gesture that slides the menu in and out.
struct ContentView: View {
    
    /// Temporary drag offset applied while the user is dragging.
    @State private var dragOffset: CGFloat = 0
    
    /// Whether the side menu is logically open or closed.
    ///
    /// The actual pixel offset is derived from this + `dragOffset`.
    @State private var isMenuOpen: Bool = false
    
    /// Which top-level screen should be displayed next to the sidebar.
    @State private var currentView: AvailableViews = .chat

    /// Used to enable/disable the "push to talk" style button when dragging.
    @State private var enablePushButton = true

    /// Tracks whether the chat text field is focused so we can dismiss the
    /// keyboard when a drag begins.
    @FocusState private var isKeyboardOpen: Bool

    /// Reserved for future animations or overlays (not used yet).
    @State private var show = false
    
    var body: some View {
        GeometryReader { geo in
            // How far the menu needs to travel to go from fully hidden to fully visible.
            let menuWidth = geo.size.width / 1.5
            
            // Base offsets for open/closed states.
            let closedMenuX = -menuWidth         // menu hidden off the left
            let openMenuX: CGFloat = 0           // menu fully visible
            
            // Content slides right when menu is open.
            let contentBaseX: CGFloat = isMenuOpen ? menuWidth : 0
            
            ZStack {
                // Main content
                Group {
                    switch currentView {
                    case .profile:
                        ProfileView()
                    case .settings:
                        SettingsView()
                    case .notifications:
                        NotificationsView()
                    case .chat:
                        ChatView(
                            enable: $enablePushButton,
                            isFocused: _isKeyboardOpen,
                            open: {
                                withAnimation(.spring(duration: 0.2)) {
                                    isMenuOpen = true
                                    dragOffset = 0
                                }
                            })
                    }
                }
                // Content follows both the open/closed state and the live drag.
                .offset(x: contentBaseX + dragOffset)
                .blur(radius: (contentBaseX + dragOffset) / 10)
                
                // Side menu
                SideView(currentView: $currentView, enable: $enablePushButton) {
                    // Button explicitly toggles menu open/closed.
                    withAnimation(.spring(duration: 0.2)) {
                        isMenuOpen.toggle()
                        dragOffset = 0
                    }
                }
                // When closed the menu sits off-screen at `closedMenuX`.
                // When open it's at `openMenuX`, plus any live drag.
                .offset(x: (isMenuOpen ? openMenuX : closedMenuX) + dragOffset)
                // Fade and blur as the menu moves in/out.
                .opacity(max(0, min(1, (Double((isMenuOpen ? menuWidth : 0) + dragOffset) - 40) / 100)))
                .blur(radius: max(0, 10 - ((isMenuOpen ? menuWidth : 0) + dragOffset) / 20))
                .zIndex(1)
            }
            .contentShape(Rectangle()) // make entire area hittable for drag
            .gesture(
                // Custom pan wrapper configured (in UIKit) for a two-finger drag.
                PanGestureWrapper { gesture in
                    let rawDrag = gesture.translation(in: gesture.view).x
                    
                    switch gesture.state {
                    case .began, .changed:
                        // Positive drag opens the menu, negative drag closes it.
                        // Clamp drag so we never drag more than `menuWidth` in either direction.
                        let maxDrag: CGFloat = menuWidth
                        dragOffset = max(-maxDrag, min(maxDrag, rawDrag))
                        
                        isKeyboardOpen = false
                        enablePushButton = false
                        
                    case .ended, .cancelled, .failed:
                        // Decide new state based on drag direction + magnitude.
                        let shouldOpen: Bool
                        if isMenuOpen {
                            // Menu is open: a strong left swipe should close it.
                            shouldOpen = rawDrag > -100
                        } else {
                            // Menu is closed: a strong right swipe should open it.
                            shouldOpen = rawDrag > 100
                        }
                        
                        withAnimation(.spring(duration: 0.2)) {
                            isMenuOpen = shouldOpen
                            dragOffset = 0
                            enablePushButton = true
                        }
                        
                    default:
                        break
                    }
                }
            )
            .onChange(of: currentView) { _, _ in
                // When switching main content from a menu tap, close the menu.
                withAnimation(.spring(duration: 0.2)) {
                    isMenuOpen = false
                    dragOffset = 0
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
