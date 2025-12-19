//
//  FavoriteButton.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/18/25.
//

import SwiftUI

/// Small reusable button that surfaces the shared favorites state in rows, detail screens, and toolbars.
struct FavoriteButton: View {
    
    var film: Film
    var viewModel: FavoritesViewModel
    
    var isFavorite: Bool {
        viewModel.isFavorite(filmID: film.id)
    }
    
    var body: some View {
        Button {
            viewModel.toggleFavorite(filmID: film.id)
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(isFavorite ? .pink : .gray)
        }
        .buttonStyle(.plain)
        .controlSize(.large)
    }
}

// Preview demonstrates how the heart toggles between filled and outline states.
#Preview {
    @Previewable @State var vm = FilmsViewModel(service: SampleFilmService())
    FavoriteButton(
        film: .preview, viewModel: FavoritesViewModel(service: SampleDefaultsFavoritesStorageService())
    )
}
