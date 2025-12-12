//
//  ChatView.swift
//  GrokUI
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Main chat surface shown when `AvailableViews.chat` is selected.
///
/// This view is responsible purely for the chat UI chrome (logo, header
/// actions, input field, and quick actions); it does **not** own sidebar or
/// gesture state. That coordination lives in `ContentView`.
struct ChatView: View {
    
    /// Controls whether the menu button can currently be tapped.
    ///
    /// `ContentView` temporarily disables this while a pan gesture is active
    /// to avoid overlapping interactions.
    @Binding var enable : Bool

    /// Focus binding for the text field so the parent can dismiss the
    /// keyboard when the user drags the content.
    @FocusState var isFocused: Bool

    /// Callback invoked when the hamburger menu button is tapped.
    ///
    /// `ContentView` injects an implementation that toggles the sidebar with
    /// a spring animation.
    var open: () -> Void
    
    var body: some View {

        
        ZStack {
            
            Color.black.ignoresSafeArea()
            GrokLogo()
            
            VStack {
                HStack {
                    
                    MenuButton(enable: $enable, open: open)
                    
                    Spacer()
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .padding()
                
                Spacer()
                
                // Horizontal list of "Grok actions" like voice mode and camera.
                ActionButtonBar()
                
                VStack(spacing: 24) {
                    // Input field + accessory controls (model selector, speak).
                    ChatField()
                    ActionToolBar()
                    
                }
                .padding(.top, 10)
                
                }
                .padding().background(.gray.opacity(0.3),in:.rect(cornerRadius:30))
            }
            .frame(maxHeight: .infinity,alignment: .bottom)
        }
    }


#Preview {
    ChatView(enable: .constant(true), open: {})
}
