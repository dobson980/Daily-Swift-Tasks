//
//  ContentView.swift
//  SegmentSwiper
//
//  Created by Thomas Dobson on 4/2/25.
//
//  This file defines the main view of the SegmentSwiper application.
//  It contains a ZStack that combines a TabView and a custom Picker
//  to allow the user to switch between Blue, Green, and Orange themed views.

import SwiftUI

/// A SwiftUI view that serves as the main content view of the SegmentSwiper application.
///
/// This view combines a TabView and a Picker wrapped in a ZStack. The TabView presents
/// three different themed views (BlueView, GreenView, OrangeView) and the Picker allows users
/// to select between them. The view layout is configured to ignore safe area insets to ensure
/// that the background covers the entire screen.
struct ContentView: View {

    /// The currently selected tab index.
    ///
    /// This state variable is used to drive the selection of the TabView and Picker.
    @State private var selectedTab = 0

    /// The body property that describes the view's content and layout.
    ///
    /// The view consists of a ZStack combining a TabView, which displays different themed views,
    /// and a VStack containing a Picker for selecting the active tab. The TabView uses a page style
    /// without an index display and is set to ignore the safe area to provide a full-screen experience.
    var body: some View {
        ZStack {
            
            // A TabView that hosts three child views (BlueView, GreenView, OrangeView)
            TabView(selection: $selectedTab) {
                BlueView()
                    .tag(0)
                GreenView()
                    .tag(1)
                OrangeView()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            // A VStack containing a Picker to allow tab selection
            VStack {
                Picker("Segement Menu", selection: $selectedTab) {
                    Text("Blue Tab").tag(0)
                    Text("Green Tab").tag(1)
                    Text("Orange Tab").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 380)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .shadow(radius: 2)
                        .frame(maxWidth: 380, maxHeight: 50)
                )
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
