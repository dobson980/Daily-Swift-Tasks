//
//  ContentView.swift
//  ListFooterExample
//
//  Created by Thomas Dobson on 3/3/25.
//

import SwiftUI

// The main view that displays a list of automobiles with a header and footer.
struct ContentView: View {
    // An array of automobile names to be displayed in the list.
    let automobiles: [String] = [
        "Toyota Camry",
        "Honda Accord",
        "Ford Mustang",
        "Chevrolet Silverado",
        "Tesla Model 3",
        "BMW 3 Series",
        "Mercedes-Benz C-Class",
        "Audi A4",
        "Volkswagen Golf",
        "Subaru Outback",
        "Mazda CX-5",
        "Hyundai Elantra",
        "Nissan Altima",
        "Kia Sorento",
        "Jeep Wrangler",
        "Ram 1500",
        "GMC Sierra",
        "Porsche 911",
        "Lexus RX",
        "Volvo XC90"
    ]
    
    var body: some View {
        // A list that displays the automobiles grouped in a single section.
        List {
            Section {
                // Iterates through each automobile in the array and creates a Text view for it.
                ForEach(automobiles, id: \.self) { automobile in
                    Text(automobile)
                }
            } header: {
                // The section header that provides a title for the list.
                Text("Automobiles")
            } footer: {
                // The section footer that provides additional information at the bottom of the section.
                Text(
                    """
                    You've viewed all the items in this section.
                    Total Items: \(automobiles.count)
                    """
                )
            }
        }
    }
}

// Preview provider for ContentView, allowing you to see the layout in Xcode’s preview canvas.
#Preview {
    ContentView()
}
