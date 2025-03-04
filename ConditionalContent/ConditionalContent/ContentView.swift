//
//  ContentView.swift
//  ConditionalContent
//
//  Created by Thomas Dobson on 3/4/25.
//

import SwiftUI

// The main view that displays the detail content and a button to show/hide extra content.
struct ContentView: View {
    // A state variable to track whether the extra content should be shown.
    @State private var showExtraContent: Bool = false
    // Example item to display in the detail view.
    let sampleDetailItem = DetailItem(
        title: "SwiftUI Basics",
        description: "This section provides an overview of the fundamental concepts in SwiftUI, including how to structure your views and manage state.",
        extraContent: "Additional resources: Apple’s official SwiftUI documentation, WWDC sessions on declarative UI, and various open-source example projects."
    )
    
    var body: some View {
        // Vertical stack to arrange title, description, extra content, and button.
        VStack(spacing: 30) {
            // Title text displayed in a large, bold font.
            Text("\(sampleDetailItem.title)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Description text displayed in a smaller callout style.
            Text("\(sampleDetailItem.description)")
                .font(.callout)
            
            // Extra content text that is conditionally displayed.
            if showExtraContent {
                Text("\(sampleDetailItem.extraContent)")
                    .font(.caption) // Smaller font size for additional resources.
                    .transition(.asymmetric(insertion: .slide, removal: .opacity))
                    // Uses an asymmetric transition: slides in when appearing, fades out when disappearing.
            }
            
            // Button to toggle the visibility of extra content.
            Button {
                // Toggles the `showExtraContent` state with a smooth bouncy animation.
                withAnimation(.bouncy) {
                    showExtraContent.toggle()
                }
            } label: {
                // Changes the button’s image based on whether the extra content is visible.
                Image(systemName: showExtraContent ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
            }
        }
        .padding(20) // Adds padding around the vertical stack.
    }
}

// A simple data model to represent the content displayed in the detail view.
struct DetailItem {
    let title: String // The title of the detail item.
    let description: String // A brief description of the item.
    let extraContent: String // Additional content shown conditionally.
}

// A preview provider for the ContentView, allowing you to see it in Xcode’s canvas.
#Preview {
    ContentView()
}
