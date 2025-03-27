//
//  GlobalQuote.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/25/25.
//

import Foundation

/**
 A model representing the global stock quote as returned by the Alpha Vantage API.
 
 This structure conforms to the `Decodable` protocol, which allows it to be directly initialized
 from JSON data. Each property corresponds to a specific piece of stock data such as the symbol,
 open price, high price, low price, current price, trading volume, and daily changes.
 */
struct GlobalQuote: Decodable {
    
    /// The stock ticker symbol.
    var symbol: String
    
    /// The opening price of the stock.
    var open: String
    
    /// The highest price during the trading session.
    var high: String
    
    /// The lowest price during the trading session.
    var low: String
    
    /// The current trading price of the stock.
    var price: String
    
    /// The trading volume of the stock.
    var volume: String
    
    /// The absolute change in the stock's price.
    var change: String
    
    /// The percentage change in the stock's price.
    var changePercent: String
    
    /**
     Maps the keys from the API's JSON response to the model's properties.
     
     The API returns keys with numeric prefixes (e.g., "01. symbol"). This enumeration bridges those keys
     to the semantic property names in this struct.
     */
    enum CodingKeys: String, CodingKey {
        case symbol = "01. symbol"
        case open = "02. open"
        case high = "03. high"
        case low = "04. low"
        case price = "05. price"
        case volume = "06. volume"
        case change = "09. change"
        case changePercent = "10. change percent"
    }
}
