# ListHeaderExample

## Overview
**ListHeaderExample** is a SwiftUI project demonstrating how to create a `List` with multiple sections, each containing a header and categorized items.

<img width="306" alt="image" src="https://github.com/user-attachments/assets/d9275b5e-ff47-468d-a426-f2d73b44d80c" />

## Features
- Uses `List` and `Section` to structure data effectively.
- Displays categorized lists for animals, food, drinks, and vehicles.
- Implements `ForEach` to dynamically generate list items from arrays.
- Enhances readability with section headers.

## Code Breakdown

### 📋 Structuring the List with Sections
The `List` is divided into multiple sections, each containing a header and related items:

```swift
List {
    Section("Animals") {
        ForEach(animals, id: \.self) { animal in
            Text(animal)
        }
    }
    
    Section("Food") {
        ForEach(food, id: \.self) { food in
            Text(food)
        }
    }

    Section("Drinks") {
        ForEach(drinks, id: \.self) { drink in
            Text(drink)
        }
    }

    Section("Vehicles") {
        ForEach(vehicles, id: \.self) { vehicle in
            Text(vehicle)
        }
    }
}
```

### 🗂️ Defining the Data Arrays
Each section is populated using a predefined array of items:

```swift
let animals = ["Dog", "Cat", "Lizard", "Elephant", "Duck"]
let food = ["Pizza", "Pasta", "Sushi", "Tacos", "Burritos"]
let drinks = ["Water", "Soda", "Tea", "Coffee", "Milk"]
let vehicles = ["Car", "Plane", "Train", "Boat"]
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`:

```swift
#Preview {
    ContentView()
}
```

## How to Run
1. Open **ListHeaderExample.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to view the categorized list.

## Notes
- Using `Section` improves list readability and organization.
- `ForEach` dynamically generates list rows, making the implementation scalable.
- SwiftUI's `List` automatically adapts to different screen sizes.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
