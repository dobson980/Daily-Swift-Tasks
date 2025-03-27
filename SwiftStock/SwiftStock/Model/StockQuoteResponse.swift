//
//  StockQuoteResponse.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/25/25.
//
//  This file defines a model for decoding the JSON response returned by the
//  Alpha Vantage API. It conforms to the Decodable protocol so that instances
//  of StockQuoteResponse can be initialized directly from JSON data using Swift's
//  Codable system.

/**
 A model representing the API response for a stock quote.

 The JSON response is expected to have a key "Global Quote" which maps
 to the actual stock data. This struct leverages the Decodable protocol
 to parse and map that JSON structure into a strongly-typed model.
 */
import Foundation

struct StockQuoteResponse: Decodable {
    /// The stock data extracted from the JSON response.
    let globalQuote: GlobalQuote
    
    /// Maps JSON keys to the properties of StockQuoteResponse.
    enum CodingKeys: String, CodingKey {
        case globalQuote = "Global Quote"
    }
}
