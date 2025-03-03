# ListFooterExample

## Overview
**ListFooterExample** is a SwiftUI project demonstrating how to use `List` with section headers and footers. This project showcases a list of automobiles with a footer displaying the total count of items.

## Features
- Uses `List` and `Section` for structured data display.
- Implements a header to label the section.
- Adds a footer to provide summary information.
- Utilizes `ForEach` to generate list items dynamically.

## Code Breakdown

### 📋 Structuring the List with a Header and Footer
The `List` contains a single section displaying automobile names, with a header and footer:

```swift
List {
    Section {
        ForEach(automobiles, id: \.self) { automobile in
            Text(automobile)
        }
    } header: {
        Text("Automobiles") // The section header.
    } footer: {
        Text(
            """
            You've viewed all the items in this section.
            Total Items: \(automobiles.count)
            """
        ) // The section footer displaying total item count.
    }
}
```

### 🚗 Defining the Data
A static array stores a list of automobile names:

```swift
let automobiles: [String] = [
    "Toyota Camry", "Honda Accord", "Ford Mustang", "Chevrolet Silverado", "Tesla Model 3",
    "BMW 3 Series", "Mercedes-Benz C-Class", "Audi A4", "Volkswagen Golf", "Subaru Outback",
    "Mazda CX-5", "Hyundai Elantra", "Nissan Altima", "Kia Sorento", "Jeep Wrangler",
    "Ram 1500", "GMC Sierra", "Porsche 911", "Lexus RX", "Volvo XC90"
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
1. Open **ListFooterExample.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see the structured list with a footer.

## Notes
- The footer dynamically displays the total count of items.
- Using `Section` enhances list readability and organization.
- The project demonstrates best practices for structuring lists in SwiftUI.

---
🚀 *Part of the Daily Swift Tasks learning journey!*