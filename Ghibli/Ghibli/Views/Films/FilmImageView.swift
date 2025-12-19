//
//  FilmImageView.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/16/25.
//

import SwiftUI

/// Wrapper around `AsyncImage` that centralizes placeholder, error, and sizing logic.
struct FilmImageView: View {
    
    let urlPath: String
    let height: CGFloat
    
    init(urlPath: String, height: CGFloat = 300) {
        self.urlPath = urlPath
        self.height = height
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlPath)) { phase in
            switch phase {
                case .empty:
                    Color(white: 0.9)
                    .overlay {
                        ProgressView()
                            .controlSize(.large)
                    }
                case .success(let image):
                    image
                    .resizable()
                    .scaledToFill()
                case .failure(let error):
                    Text("Could not get image: \(error.localizedDescription)")
                @unknown default:
                    EmptyView()
            }
        }
        .frame(height: height)
    }
}
// Poster preview shows the cropped portrait configuration used in list rows.
#Preview("Poster Image") {
    FilmImageView(urlPath: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg", height: 150)
}

// Banner preview mirrors the edge-to-edge hero at the top of the detail screen.
#Preview("Banner Image") {
    FilmImageView(urlPath: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg")
}
