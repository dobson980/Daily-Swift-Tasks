//
//  Animals.swift
//  AnimalSearch
//
//  Created by Thomas Dobson on 3/9/25.
//

import Foundation

// Define the Animal struct, which represents an individual animal.
// Conforming to the Identifiable protocol allows each animal to have a unique ID.
struct Animal: Identifiable {
    // A unique identifier automatically generated for each animal.
    let id = UUID()
    // The name of the animal.
    let name: String
    // The type of species (e.g., Mammal, Bird, Reptile, etc.).
    let speciesType: String
    // The typical habitat where the animal is found.
    let habitat: String
}

// Create an array of Animal instances to serve as the data source for the app.
let animals: [Animal] = [
    // Each Animal is initialized with a name, species type, and habitat.
    Animal(name: "Aardvark", speciesType: "Mammal", habitat: "Savannah"),
    Animal(name: "Albatross", speciesType: "Bird", habitat: "Ocean"),
    Animal(name: "Alligator", speciesType: "Reptile", habitat: "Swamp"),
    Animal(name: "Alpaca", speciesType: "Mammal", habitat: "Mountains"),
    Animal(name: "Ant", speciesType: "Insect", habitat: "Various"),
    Animal(name: "Anteater", speciesType: "Mammal", habitat: "Rainforest"),
    Animal(name: "Antelope", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Ape", speciesType: "Mammal", habitat: "Jungle"),
    Animal(name: "Armadillo", speciesType: "Mammal", habitat: "Desert"),
    Animal(name: "Donkey", speciesType: "Mammal", habitat: "Farms"),
    Animal(name: "Baboon", speciesType: "Mammal", habitat: "Savannah"),
    Animal(name: "Badger", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Barracuda", speciesType: "Fish", habitat: "Ocean"),
    Animal(name: "Bat", speciesType: "Mammal", habitat: "Caves"),
    Animal(name: "Bear", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Beaver", speciesType: "Mammal", habitat: "Rivers"),
    Animal(name: "Bee", speciesType: "Insect", habitat: "Meadows"),
    Animal(name: "Bison", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Boar", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Buffalo", speciesType: "Mammal", habitat: "Plains"),
    Animal(name: "Butterfly", speciesType: "Insect", habitat: "Gardens"),
    Animal(name: "Camel", speciesType: "Mammal", habitat: "Desert"),
    Animal(name: "Capybara", speciesType: "Mammal", habitat: "Wetlands"),
    Animal(name: "Caribou", speciesType: "Mammal", habitat: "Tundra"),
    Animal(name: "Cassowary", speciesType: "Bird", habitat: "Rainforest"),
    Animal(name: "Cat", speciesType: "Mammal", habitat: "Various"),
    Animal(name: "Caterpillar", speciesType: "Insect", habitat: "Forests"),
    Animal(name: "Cattle", speciesType: "Mammal", habitat: "Farms"),
    Animal(name: "Chameleon", speciesType: "Reptile", habitat: "Rainforest"),
    Animal(name: "Cheetah", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Chicken", speciesType: "Bird", habitat: "Farms"),
    Animal(name: "Chimpanzee", speciesType: "Mammal", habitat: "Jungle"),
    Animal(name: "Chinchilla", speciesType: "Mammal", habitat: "Mountains"),
    Animal(name: "Clam", speciesType: "Mollusk", habitat: "Ocean"),
    Animal(name: "Cobra", speciesType: "Reptile", habitat: "Forests"),
    Animal(name: "Cockroach", speciesType: "Insect", habitat: "Urban"),
    Animal(name: "Cod", speciesType: "Fish", habitat: "Ocean"),
    Animal(name: "Coyote", speciesType: "Mammal", habitat: "Plains"),
    Animal(name: "Crab", speciesType: "Crustacean", habitat: "Beaches"),
    Animal(name: "Crocodile", speciesType: "Reptile", habitat: "Rivers"),
    Animal(name: "Crow", speciesType: "Bird", habitat: "Various"),
    Animal(name: "Deer", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Dog", speciesType: "Mammal", habitat: "Domestic"),
    Animal(name: "Dolphin", speciesType: "Mammal", habitat: "Ocean"),
    Animal(name: "Dove", speciesType: "Bird", habitat: "Urban"),
    Animal(name: "Dragonfly", speciesType: "Insect", habitat: "Wetlands"),
    Animal(name: "Duck", speciesType: "Bird", habitat: "Lakes"),
    Animal(name: "Eagle", speciesType: "Bird", habitat: "Mountains"),
    Animal(name: "Elephant", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Elk", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Falcon", speciesType: "Bird", habitat: "Cliffs"),
    Animal(name: "Ferret", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Flamingo", speciesType: "Bird", habitat: "Wetlands"),
    Animal(name: "Fox", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Frog", speciesType: "Amphibian", habitat: "Swamps"),
    Animal(name: "Giraffe", speciesType: "Mammal", habitat: "Savannah"),
    Animal(name: "Goat", speciesType: "Mammal", habitat: "Mountains"),
    Animal(name: "Gorilla", speciesType: "Mammal", habitat: "Jungle"),
    Animal(name: "Hamster", speciesType: "Mammal", habitat: "Domestic"),
    Animal(name: "Hawk", speciesType: "Bird", habitat: "Forests"),
    Animal(name: "Hedgehog", speciesType: "Mammal", habitat: "Meadows"),
    Animal(name: "Hippopotamus", speciesType: "Mammal", habitat: "Rivers"),
    Animal(name: "Horse", speciesType: "Mammal", habitat: "Farms"),
    Animal(name: "Hummingbird", speciesType: "Bird", habitat: "Forests"),
    Animal(name: "Hyena", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Jaguar", speciesType: "Mammal", habitat: "Rainforest"),
    Animal(name: "Kangaroo", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Koala", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Leopard", speciesType: "Mammal", habitat: "Jungle"),
    Animal(name: "Lion", speciesType: "Mammal", habitat: "Savannah"),
    Animal(name: "Llama", speciesType: "Mammal", habitat: "Mountains"),
    Animal(name: "Lynx", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Mongoose", speciesType: "Mammal", habitat: "Grasslands"),
    Animal(name: "Moose", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Octopus", speciesType: "Mollusk", habitat: "Ocean"),
    Animal(name: "Otter", speciesType: "Mammal", habitat: "Rivers"),
    Animal(name: "Owl", speciesType: "Bird", habitat: "Forests"),
    Animal(name: "Panda", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Penguin", speciesType: "Bird", habitat: "Antarctic"),
    Animal(name: "Tiger", speciesType: "Mammal", habitat: "Rainforest"),
    Animal(name: "Wolf", speciesType: "Mammal", habitat: "Forests"),
    Animal(name: "Zebra", speciesType: "Mammal", habitat: "Savannah")
]
