# RandomQuote

## Overview
**RandomQuote** is a SwiftUI project that fetches and displays random inspirational quotes using the Forismatic API. Users can tap a button to retrieve a new quote dynamically.

## Features
- Fetches a random quote asynchronously from the Forismatic API.
- Displays the quote with the author’s name in a structured UI.
- Uses `@State` to manage the displayed quote and author.
- Implements `URLSession` for network requests with proper error handling.

## Code Breakdown

### 🔄 Managing Quote Data
Two `@State` properties store the quote and author:

```swift
@State private var quote: String = "Find an inspiring quote!"
@State private var author: String = ""
```

### 🏗️ Structuring the UI
The `VStack` arranges the quote, author, and button:

```swift
VStack {
    Spacer()

    Text("\(quote)")
        .font(.system(size: 25, weight: .semibold))
        .multilineTextAlignment(.center)
        .padding(.bottom, 10)

    Text("\(author)")
        .font(.system(size: 18, weight: .thin))

    Spacer()

    Button {
        Task {
            await fetchQuote()
        }
    } label: {
        HStack {
            Image(systemName: "quote.bubble")
            Text("Get Quote")
        }
    }
    .buttonStyle(.borderedProminent)
}
.padding()
```

### 🌐 Fetching Quotes Asynchronously
The `fetchQuote()` function makes a network request to retrieve a random quote:

```swift
func fetchQuote() async {
    guard let quoteURL = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json") else {
        print("failed to create URL.")
        return
    }
    do {
        let (data, response) = try await URLSession.shared.data(from: quoteURL)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            print("Invalid Status Code: \(httpResponse.statusCode)")
            return
        }

        let quoteData = try JSONDecoder().decode(ForismaticQuote.self, from: data)
        self.quote = quoteData.quoteText
        self.author = "~ \(quoteData.quoteAuthor)"
    } catch {
        print("failed to get quote data: \(error.localizedDescription)")
    }
}
```

### 📌 Defining the Quote Model
A `Decodable` struct maps the JSON response:

```swift
struct ForismaticQuote: Decodable {
    let quoteText: String
    let quoteAuthor: String
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `RandomQuoteView`:

```swift
#Preview {
    RandomQuoteView()
}
```

## How to Run
1. Open **RandomQuote.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and tap "Get Quote" to retrieve a random quote.

## Notes
- Uses `Task { await fetchQuote() }` to handle asynchronous network calls.
- The Forismatic API occasionally returns an empty author name.
- The button applies `.buttonStyle(.borderedProminent)` for visibility.

---
🚀 *Part of the Daily Swift Tasks learning journey!*