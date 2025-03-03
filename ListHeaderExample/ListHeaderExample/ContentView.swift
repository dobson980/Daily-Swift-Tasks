//
//  ContentView.swift
//  ListHeaderExample
//
//  Created by Thomas Dobson on 3/2/25.
//

import SwiftUI

// The main view that displays a list organized into sections.
struct ContentView: View {
    
    // Example data arrays for each section of the list.
    let animals = ["Dog", "Cat", "Lizard", "Elephant", "Duck"]
    let food = ["Pizza", "Pasta", "Sushi", "Tacos", "Burritos"]
    let drinks = ["Water", "Soda", "Tea", "Coffee", "Milk"]
    let vehicles = ["Car", "Plane", "Train", "Boat"]
    
    var body: some View {
        // A list containing multiple sections, each with a header and related items.
        List {
            // The "Animals" section.
            Section("Animals") {
                // Loops through the `animals` array and creates a `Text` view for each item.
                ForEach(animals, id: \.self) { animal in
                    Text(animal)
                }
            }
            
            // The "Food" section.
            Section("Food") {
                // Loops through the `food` array and creates a `Text` view for each item.
                ForEach(food, id: \.self) { food in
                    Text(food)
                }
            }
            
            // The "Drinks" section.
            Section("Drinks") {
                // Loops through the `drinks` array and creates a `Text` view for each item.
                ForEach(drinks, id: \.self) { drink in
                    Text(drink)
                }
            }
            
            // The "Vehicles" section.
            Section("Vehicles") {
                // Loops through the `vehicles` array and creates a `Text` view for each item.
                ForEach(vehicles, id: \.self) { vehicle in
                    Text(vehicle)
                }
            }
        }
    }
}

// Preview for Xcode’s canvas to display the ContentView.
#Preview {
    ContentView()
}
