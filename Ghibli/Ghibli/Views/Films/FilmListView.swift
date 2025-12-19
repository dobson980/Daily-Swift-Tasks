//
//  FilmListView.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

import SwiftUI

/// Reusable list rendering that works for the films tab, favorites tab, and search results.
struct FilmListView: View {
    
    var films: [Film]
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        List(films) { film in
            NavigationLink(value: film) {
                FilmRow(film: film, favoritesViewModel: favoritesViewModel)
            }
        }
        // Defining the navigation destination here keeps the push animation consistent regardless of which parent view presented the list.
        .navigationDestination(for: Film.self) { film in
            FilmDetailScreen(film: film, favoritesViewModel: favoritesViewModel)
        }
    }
}

// Preview quickly verifies navigation wiring in isolation from the full app shell.
#Preview {
    @Previewable @State var vm = FilmsViewModel(service: SampleFilmService())
    @Previewable @State var fvm = FavoritesViewModel(service: SampleDefaultsFavoritesStorageService())
    
    NavigationStack {
        FilmListView(
            films: vm.films,
            favoritesViewModel: fvm
        )

    }
    .task {
        await vm.fetch()
        fvm.load()
    }
}
