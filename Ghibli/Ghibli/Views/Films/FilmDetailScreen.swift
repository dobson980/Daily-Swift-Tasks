//
//  FilmDetailScreen.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

import SwiftUI

/// Detail experience that shows the hero artwork, metadata, and lazily loaded character list.
struct FilmDetailScreen: View {
    
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    
    @State private var viewModel = FilmDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                
                FilmImageView(urlPath: film.bannerImage)
                    .clipped()
                    .containerRelativeFrame(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(film.title)
                    
                    Divider()
                    
                    Text("Characters")
                        .font(.title3)
                    
                    switch viewModel.state {
                        case .idle: EmptyView()
                        case .loading: ProgressView()
                        case .loaded(let people):
                            ForEach(people) { person in
                                Text(person.name)
                            }
                        case .error(let error):
                            Text(error)
                                .foregroundStyle(.pink)
                        }
                }
                .padding()
            }
            .toolbar {
                FavoriteButton(film: film, viewModel: favoritesViewModel)
            }
            .task(id: film) {
                // Using `task(id:)` means a new fetch fires if a different film is pushed while the view stays alive.
                await viewModel.fetch(for: film)
            }
        }
    }
}

// Preview hits the mock services so you can iterate on the layout offline.
#Preview {
    NavigationStack {
        FilmDetailScreen(
            film: .preview,
            favoritesViewModel: FavoritesViewModel(service: SampleDefaultsFavoritesStorageService())
        )
    }
}
