//
//  ContentView.swift
//  ResponsiveLayout
//
//  Created by Thomas Dobson on 3/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // A GeometryReader provides the dimensions of the available space,
        // allowing the layout to adapt dynamically.
        GeometryReader { geometry in
            // Calculate the smaller of the width and height to ensure consistent proportions.
            let minDimension = min(geometry.size.width, geometry.size.height)
            
            // HStack and VStack arrange the shapes horizontally and vertically respectively.
            HStack {
                VStack {
                    // A red rectangle sized relative to the smaller screen dimension.
                    Rectangle()
                        .frame(
                            width: minDimension / 3,
                            height: minDimension / 3
                        )
                        .foregroundStyle(.red) // Set the rectangle’s color.
                    
                    // A blue circle, also sized relative to the smaller screen dimension.
                    Circle()
                        .frame(width: minDimension / 2)
                        .foregroundStyle(.blue) // Set the circle’s color.
                }
            }
            // The outer frame ensures the content takes up the entire available space,
            // keeping the layout centered.
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// A preview provider to show how ContentView looks in Xcode’s preview canvas.
#Preview {
    ContentView()
}
