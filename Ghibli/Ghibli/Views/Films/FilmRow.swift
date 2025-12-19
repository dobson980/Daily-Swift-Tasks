//
//  FilmRow.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/18/25.
//

import SwiftUI

/// Row layout containing the poster, metadata, and inline favorite toggle.
struct FilmRow: View {
    
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            FilmImageView(urlPath: film.image, height: 150)
                .frame(width: 100)
                .clipped()
            
            VStack(alignment: .leading) {
                HStack {
                    Text(film.title)
                        .bold()
                    
                    Spacer()
                    
                    // Tapping here updates the shared FavoritesViewModel so every tab instantly reflects the change.
                    FavoriteButton(film: film, viewModel: favoritesViewModel)
                }
                .padding(.bottom)
                
                Text("Directed by \(film.director)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("Released: \(film.releaseYear)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.top)

        }
    }
}

// Preview highlights the compact row layout for quick visual tweaks.
#Preview {
    FilmRow(
        film: .preview,
        favoritesViewModel: FavoritesViewModel(service: SampleDefaultsFavoritesStorageService())
    )
}
