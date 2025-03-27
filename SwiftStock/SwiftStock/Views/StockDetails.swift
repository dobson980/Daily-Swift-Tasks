// File: `StockDetails.swift`

import SwiftUI

/**
 A view that presents detailed stock information.

 This view displays various fields of stock data including the stock symbol, price, percentage change, and additional metrics
 such as open, high, low prices, and volume. It leverages a helper method to convert the percentage string into a numeric value for formatting.
 */
struct StockDetails: View {
    /// The stock data provided to the view from a \`GlobalQuote\` model.
    let stockData: GlobalQuote
    
    var body: some View {
        VStack {
            Spacer()
            // Display the stock symbol with a large, bold font.
            Text(stockData.symbol)
                .font(.system(size: 75, weight: .bold))
                .padding(.bottom, 10)
            
            // Format and display the stock price as a currency value.
            if let priceValue = Double(stockData.price) {
                Text(priceValue, format: .currency(code: "USD"))
                    .font(.system(size: 30, weight: .bold))
            } else {
                Text("N/A")
            }
            
            // Extract and display percentage change; shows a '+' sign for positive changes.
            let percentString = stockData.changePercent
            if let percentValue = extractPercentValue(from: percentString) {
                Text((percentValue < 0 ? "" : "+") + String(format: "%.2f", percentValue) + "%")
                    .foregroundColor(percentValue < 0 ? .red : .green)
                    .padding(.bottom, 20)
            } else {
                Text("N/A")
            }
            
            // Display the open, high, and low values in a horizontal stack.
            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Open")
                    Text("High")
                    Text("Low")
                }
                VStack(alignment: .trailing) {
                    // Convert each string value to Double and format as currency; fallback displays "N/A".
                    if let openValue = Double(stockData.open) {
                        Text(openValue, format: .currency(code: "USD"))
                    } else {
                        Text("N/A")
                    }
                    if let highValue = Double(stockData.high) {
                        Text(highValue, format: .currency(code: "USD"))
                    } else {
                        Text("N/A")
                    }
                    if let lowValue = Double(stockData.low) {
                        Text(lowValue, format: .currency(code: "USD"))
                    } else {
                        Text("N/A")
                    }
                }
            }
            .padding(.bottom, 10)
            
            // Display the volume title and formatted volume value.
            Text("Volume")
                .font(.title3)
            if let volumeValue = Double(stockData.volume) {
                Text(volumeValue, format: .number)
            } else {
                Text("N/A")
            }
            Spacer()
        }
    }
    
    /**
     Extracts a numeric percentage value from a string representation.
     
     This helper function removes the \`%\` character and any extraneous spaces, then converts the cleaned string into a Double. 
     
     - Parameter percentString: A string value representing the percentage change (e.g., "5.23%").
     - Returns: A Double value if conversion is successful; otherwise, \`nil\`.
     */
    private func extractPercentValue(from percentString: String) -> Double? {
        let cleanedString = percentString.replacingOccurrences(of: "%", with: "").trimmingCharacters(in: .whitespaces)
        return Double(cleanedString)
    }
}

#Preview {
    // Sample preview using dummy data for testing in Xcode Canvas.
    let stock = GlobalQuote(
        symbol: "AAPL",
        open: "282.5400",
        high: "284.9000",
        low: "266.5100",
        price: "272.0600",
        volume: "150741034",
        change: "-16.0800",
        changePercent: "-5.5806%"
    )
    StockDetails(stockData: stock)
}
