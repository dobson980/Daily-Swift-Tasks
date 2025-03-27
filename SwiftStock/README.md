# SwiftStock

## Overview
**SwiftStock** is a SwiftUI application that allows users to fetch and display real-time stock data using the [Alpha Vantage API](https://www.alphavantage.co/). The app provides a search interface to look up a stock ticker and view key information including price, volume, and daily changes.

## Features
- 🔍 Live stock lookup by ticker symbol
- 📊 Displays open, high, low, price, volume, and percent change
- ❌ Error banners for invalid inputs or network failures
- 🌐 Fetches data asynchronously using `URLSession` and Swift Concurrency
- 📱 Built with SwiftUI and MVVM architecture

## How to Use

### 1. Set Up Your API Key
To use this app, you need to provide your own Alpha Vantage API key.

#### Steps:
1. Visit [https://www.alphavantage.co/support/#api-key](https://www.alphavantage.co/support/#api-key) and sign up to get your free API key.
2. In your Xcode project, create a new file:
   - Right-click the **SwiftStock** group > **New File** > **Property List** > Name it `APIKeys.plist`.
3. Add a dictionary entry:
   - **Key:** `StockAPIKey`  
   - **Type:** `String`  
   - **Value:** *Your API Key*

_Example:_
```xml
<key>StockAPIKey</key>
<string>YOUR_API_KEY_HERE</string>
```

> 📷 Refer to the included screenshot in this repository for how the `APIKeys.plist` should look.

### 2. Run the Project
1. Open **SwiftStock.xcodeproj** in Xcode.
2. Build and run on a simulator or device.
3. Type a valid stock ticker symbol (e.g., `AAPL`) into the search bar and press return.

## Project Structure

| File | Description |
|------|-------------|
| `ContentView.swift` | UI logic for displaying input field, error banner, and fetched results. |
| `StockViewModel.swift` | Observable view model that fetches data and handles errors. |
| `alphavantageService.swift` | Service responsible for calling the Alpha Vantage API and decoding the data. |
| `GlobalQuote.swift` | Model representing the decoded quote from the API. |
| `StockQuoteResponse.swift` | Top-level API response model. |
| `StockDetails.swift` | View for presenting detailed stock information. |
| `ErrorBanner.swift` | Reusable UI component for displaying error messages. |

## Error Handling
The app shows banner messages for common issues like:
- Invalid ticker symbol
- Missing or incorrect API key
- Network or data decoding issues

## Preview Support
The project uses `#Preview` macros to support interactive previews in Xcode for all major views including:
- `ContentView`
- `ErrorBanner`
- `StockDetails`

## License
This project is built for learning and personal use. Feel free to use and adapt it to suit your needs.

---

🚀 *Built as part of the Daily Swift Tasks learning journey.*
