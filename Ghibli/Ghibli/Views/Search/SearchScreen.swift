//
//  SearchScreen.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

import SwiftUI

/// Dedicated tab that demonstrates debounced, asynchronous searching with shared favorites state.
struct SearchScreen: View {
    
    @State private var text: String = ""
    @State private var searchViewModel =  SearchFilmsViewModel()
    let favoritesViewModel: FavoritesViewModel
    
    init(
        favoritesViewModel: FavoritesViewModel,
        service : GhibliApiService = GhibliApiService()
    ) {
        self.favoritesViewModel = favoritesViewModel
        self.searchViewModel = SearchFilmsViewModel(service: service)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                switch searchViewModel.state {
                case .idle:
                    Text("Your search results will be shown here.")
                case .loaded(let films):
                    FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                case .loading:
                    ProgressView("Loading..")
                case .error(let error):
                    Text(error)
                }

                
            }
            .navigationTitle("Search Ghibli Movies")
            .searchable(text: $text)
            .task(id: text) {
                // Every keystroke updates `text`, which in turn restarts this task and leverages the debounce logic inside the view model.
                await searchViewModel.fetch(for: text)
            }
        }
    }
}

// Preview hooks up a sample favorites store so the hearts remain interactive.
#Preview {
    SearchScreen(
        favoritesViewModel: FavoritesViewModel(service: SampleDefaultsFavoritesStorageService())
    )
}
