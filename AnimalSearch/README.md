# AnimalSearch

## Overview
**AnimalSearch** is a SwiftUI project that demonstrates how to implement a simple search feature within a list. Users can filter a list of animals by typing into a search bar, which dynamically updates the displayed results.

## Features
- Uses `@State` to track user search input.
- Implements `List` to display a dynamic list of animals.
- Uses `.searchable(text:)` to provide a built-in search bar.
- Filters the list of animals in real time based on user input.

## Code Breakdown

### 🔍 Managing Search Input
A `@State` property tracks the user's search input:

```swift
@State private var animalSearch = ""
```

### 📋 Filtering the Animal List
A computed property filters the animals based on the search query:

```swift
var filteredAnimals: [Animal] {
    if animalSearch.isEmpty {
        return animals
    } else {
        return animals.filter { animal in
            animal.name.lowercased().contains(animalSearch.lowercased())
        }
    }
}
```

### 🏗️ Structuring the ContentView
The `NavigationStack` contains a `List` with a searchable modifier:

```swift
NavigationStack {
    List(filteredAnimals) { animal in
        Text("\(animal.name)")
    }
    .searchable(text: $animalSearch)
}
```

### 🗂️ Defining the Animal Data Model
The `Animal` struct represents an individual animal:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let speciesType: String
    let habitat: String
}
```

### 📚 Sample Animal Data
A predefined array of animals serves as the app’s dataset:

```swift
let animals: [Animal] = [
    Animal(name: "Aardvark", speciesType: "Mammal", habitat: "Savannah"),
    Animal(name: "Albatross", speciesType: "Bird", habitat: "Ocean"),
    Animal(name: "Alligator", speciesType: "Reptile", habitat: "Swamp"),
    Animal(name: "Alpaca", speciesType: "Mammal", habitat: "Mountains"),
    ...
]
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **AnimalSearch.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and use the search bar to filter animals.

## Notes
- `.searchable(text:)` automatically integrates a search UI into the `List`.
- Filtering is case-insensitive, making searches more user-friendly.
- The dataset includes various animals with different species and habitats.

---
🚀 *Part of the Daily Swift Tasks learning journey!*