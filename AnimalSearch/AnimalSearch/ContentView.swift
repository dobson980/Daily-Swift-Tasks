//
//  ContentView.swift
//  AnimalSearch
//
//  Created by Thomas Dobson on 3/9/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    // Holds the user's current search text.
    @State private var animalSearch = ""
    
    // Computed property that filters the animals array based on the search text.
    // If the search text is empty, it returns the full list of animals.
    // Otherwise, it filters the animals whose names contain the search text (case-insensitive).
    var filteredAnimals: [Animal] {
        if animalSearch.isEmpty {
            return animals
        } else {
            return animals.filter { animal in
                animal.name.lowercased().contains(animalSearch.lowercased())
            }
        }
    }
    
    var body: some View {
        // NavigationStack allows for navigation between views.
        NavigationStack {
            // List displays each animal from the filteredAnimals array.
            List(filteredAnimals) { animal in
                // Display the animal's name in a Text view.
                Text("\(animal.name)")
            }
            // Adds a search bar to the List, binding it to the animalSearch state.
            .searchable(text: $animalSearch)
        }
    }
}

#Preview {
    ContentView()
}
