//
//  FilmsScreen.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

import SwiftUI

/// Primary list experience that reacts to `FilmsViewModel.state`.
struct FilmsScreen: View {
    
    let viewModel: FilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            
            Group {
                switch viewModel.state {
                    case .idle:
                        Text("No Films Loaded")
                    case .loading:
                        ProgressView {
                            Text("Loading Films...")
                        }
                    case .loaded(let films):
                        FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                    case .error(let error):
                        Text(error)
                            .foregroundStyle(.pink)
                    }
            }
            // Navigation title sits outside the switch so it stays put across all states.
            .navigationTitle("Ghibli Films")
        }
    }
}

// Preview ensures the film list renders sample data and favorites simultaneously.
#Preview {
    FilmsScreen(
        viewModel: FilmsViewModel(service: SampleFilmService()),
        favoritesViewModel: FavoritesViewModel(service: SampleDefaultsFavoritesStorageService())
    )
}
