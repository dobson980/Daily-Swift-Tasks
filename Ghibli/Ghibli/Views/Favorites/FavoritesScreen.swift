//
//  FavoritesScreen.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

import SwiftUI

/// Derived view that filters the shared `FilmsViewModel` list down to only the favorited IDs.
struct FavoritesScreen: View {
    
    let viewModel: FilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    
    var films: [Film] {
        // Compute a derived array instead of duplicating state, so we never risk the lists drifting apart.
        let favorites = favoritesViewModel.favoriteIDs
        return viewModel.films.filter { favorites.contains($0.id) }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if films.isEmpty {
                    ContentUnavailableView("No Favorites yet", systemImage: "heart")
                } else {
                    FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

// Preview seeds a couple of favorites so the empty state and populated list can be tested quickly.
#Preview {
    @Previewable @State var filmsVM = FilmsViewModel(service: SampleFilmService())
    @Previewable @State var favoritesVM = FavoritesViewModel(service: SampleDefaultsFavoritesStorageService())

    FavoritesScreen(viewModel: filmsVM, favoritesViewModel: favoritesVM)
        .task {
            await filmsVM.fetch()
            for film in filmsVM.films.prefix(2) {
                favoritesVM.toggleFavorite(filmID: film.id)
            }
        }
}
