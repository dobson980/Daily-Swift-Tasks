//
//  ContentView.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import SwiftUI

/// Root container that wires up the tab bar and shares view models across tabs.
///
/// The same `FilmsViewModel` instance is injected into multiple screens so data only
/// needs to load once, and the same `FavoritesViewModel` keeps the favorites tab/search
/// results in sync with the film list.
struct ContentView: View {
    
    @State private var filmsViewModel = FilmsViewModel()
    @State private var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        TabView {
            Tab("Films", systemImage: "movieclapper") {
                FilmsScreen(viewModel: filmsViewModel, favoritesViewModel: favoritesViewModel)
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesScreen(viewModel: filmsViewModel, favoritesViewModel: favoritesViewModel)
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsScreen()
            }
            
            Tab(role: .search) {
                SearchScreen(favoritesViewModel: favoritesViewModel)
            }
        }
        .task {
            // Kick off persistence + networking as soon as the view appears so the tabs are ready.
            favoritesViewModel.load()
            await filmsViewModel.fetch()
        }
    }
}

/// Previewing the tab layout ensures the view hierarchy stays responsive as we add new sections.
#Preview {
    ContentView()
}
