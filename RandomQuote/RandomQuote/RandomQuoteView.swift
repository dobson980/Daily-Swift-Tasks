//
//  ContentView.swift
//  RandomQuote
//
//  Created by Thomas Dobson on 3/15/25.
//

import SwiftUI

// RandomQuoteView is a SwiftUI view that displays a random quote and its author.
// It includes a button that triggers an asynchronous network call to fetch a new quote.
struct RandomQuoteView: View {
    // State variable to hold the quote text.
    @State private var quote: String = "Find an inspiring quote!"
    // State variable to hold the quote's author.
    @State private var author: String = ""
    
    var body: some View {
        VStack {
            Spacer() // Pushes the content toward the center vertically.
            
            // Displays the quote text.
            Text("\(quote)")
                .font(.system(size: 25, weight: .semibold)) // Uses a semibold system font for readability.
                .multilineTextAlignment(.center) // Centers the text for a better appearance.
                .padding(.bottom, 10) // Adds spacing below the quote.
            
            // Displays the author of the quote.
            Text("\(author)")
                .font(.system(size: 18, weight: .thin)) // Uses a lighter font for the author.
            
            Spacer() // Ensures the content is vertically centered.
            
            // Button to trigger fetching a new quote.
            Button {
                // Start an asynchronous task when the button is tapped.
                Task {
                    await fetchQuote()
                }
            } label: {
                // Button label composed of an icon and text.
                HStack {
                    Image(systemName: "quote.bubble") // Icon representing quotes.
                    Text("Get Quote") // Label text.
                }
            }
            .buttonStyle(.borderedProminent) // Applies a prominent bordered style to the button.
        }
        .padding() // Adds padding around the entire view.
    }
    
    // fetchQuote() asynchronously fetches a random quote from the Forismatic API.
    func fetchQuote() async {
        // Attempt to create a valid URL from the API string.
        guard let quoteURL = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json") else {
            print("failed to create URL.")
            return
        }
        do {
            // Await the response from URLSession. This returns a tuple (data, response).
            let (data, response) = try await URLSession.shared.data(from: quoteURL)
            
            // Validate the HTTP response code; if it's not 200 (OK), print an error.
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Invalid Status Code: \(httpResponse.statusCode)")
                return
            }
            
            // Decode the returned JSON data into a ForismaticQuote model.
            // This will throw an error if the data doesn't match the model.
            let quoteData = try JSONDecoder().decode(ForismaticQuote.self, from: data)
            
            // Update the UI with the fetched quote and author.
            // Using self.quote and self.author ensures that SwiftUI updates the view.
            self.quote = quoteData.quoteText
            self.author = "~ \(quoteData.quoteAuthor)"
        } catch {
            // If any error occurs during the network call or JSON decoding, print a detailed error message.
            print("failed to get quote data: \(error.localizedDescription)")
        }
    }
}

// ForismaticQuote represents the JSON response from the Forismatic API.
// It conforms to Decodable so that JSONDecoder can create an instance from JSON data.
struct ForismaticQuote: Decodable {
    let quoteText: String   // The text of the quote.
    let quoteAuthor: String // The author of the quote.
}

// The #Preview macro creates an interactive preview of the RandomQuoteView in Xcode.
#Preview {
    RandomQuoteView()
}
