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
    // State variable to indicate when a network request is in progress.
    @State private var loading: Bool = false
    
    var body: some View {
        VStack {
            Spacer() // Pushes the content toward the center vertically.
            
            // Display the quote text with styling.
            Text("\(quote)")
                .font(.system(size: 25, weight: .semibold)) // Semibold font for readability.
                .multilineTextAlignment(.center) // Center align the text.
                .padding(.bottom, 10) // Spacing below the quote.
            
            // Display the author text with a lighter font style.
            Text("\(author)")
                .font(.system(size: 18, weight: .thin))
            
            Spacer() // Ensures the content is centered vertically.
            
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
                    Text("Get Quote") // Button label.
                }
            }
            .buttonStyle(.borderedProminent) // Applies a prominent bordered style to the button.
            .disabled(loading) // Disables the button while loading is true.
        }
        .padding() // Adds padding around the entire view.
    }
    
    // fetchQuote() asynchronously fetches a random quote from the Forismatic API.
    func fetchQuote() async {
        // Set loading state to true to disable button interaction.
        loading = true
        
        // Attempt to create a valid URL from the API string.
        guard let quoteURL = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json") else {
            print("failed to create URL.")
            loading = false
            return
        }
        
        do {
            // Await the response from URLSession.
            // This call returns a tuple containing the raw data and the URLResponse.
            let (data, response) = try await URLSession.shared.data(from: quoteURL)
            
            // Validate the HTTP response code; if it's not 200 (OK), print an error.
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Invalid Status Code: \(httpResponse.statusCode)")
                loading = false
                return
            }
            
            // Convert the raw data into a string to inspect and preprocess it.
            if let rawString = String(data: data, encoding: .utf8) {
                // Replace problematic escape sequences.
                let cleanedString = rawString.replacingOccurrences(of: "\\'", with: "'")
                
                // Convert the cleaned string back into Data.
                guard let cleanedData = cleanedString.data(using: .utf8) else {
                    print("Failed to convert cleaned string back to Data")
                    loading = false
                    return
                }
                
                // Decode the JSON data into a ForismaticQuote model.
                let quoteData = try JSONDecoder().decode(ForismaticQuote.self, from: cleanedData)
                
                // Update the UI with the fetched quote and author.
                self.quote = quoteData.quoteText
                // If the author field is empty, default to "Unknown".
                if quoteData.quoteAuthor.isEmpty {
                    self.author = "~ Unknown"
                } else {
                    self.author = "~ \(quoteData.quoteAuthor)"
                }
                loading = false
            }
        } catch {
            // If any error occurs during the network request or JSON decoding,
            // print a detailed error message and reset the loading state.
            loading = false
            print("failed to get quote data: \(error)")
        }
    }
}

// ForismaticQuote represents the JSON response from the Forismatic API.
// It conforms to Decodable so that JSONDecoder can create an instance from the JSON data.
struct ForismaticQuote: Decodable {
    let quoteText: String   // The text of the quote.
    let quoteAuthor: String // The author of the quote.
}

// The #Preview macro creates an interactive preview of the RandomQuoteView in Xcode.
#Preview {
    RandomQuoteView()
}
