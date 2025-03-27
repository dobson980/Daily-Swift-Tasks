//
//  alphavantageService.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/25/25.
//

import Foundation

/**
 A service class that handles communication with the Alpha Vantage API.

 This class is responsible for loading the API key from a local plist file and fetching stock data 
 for a given ticker symbol asynchronously.
 */
class AlphavantageService {
    
    /**
     Loads the API key from the `APIKeys.plist` resource file.

     The function locates the plist file, reads it into a dictionary, and then extracts the API key 
     associated with the key "StockAPIKey".

     - Throws:
        - `LoadAPIKeyError.fileNotFound` if the file is not found.
        - `LoadAPIKeyError.dictionaryNotFound` if the file contents cannot be converted to a dictionary.
        - `LoadAPIKeyError.apiKeyNotFound` if the "StockAPIKey" entry does not exist.
     
     - Returns: A `String` representing the API key.
     */
    private func loadAPIKey() throws -> String {
        guard let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist") else {
            throw LoadAPIKeyError.fileNotFound
        }
        
        guard let dict = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            throw LoadAPIKeyError.dictionaryNotFound
        }
        
        guard let apiKey = dict["StockAPIKey"] as? String else {
            throw LoadAPIKeyError.apiKeyNotFound
        }
        
        print("API Key: \(apiKey)")
        return apiKey
    }
    
    /**
     Fetches stock data for a specified ticker symbol from the Alpha Vantage API.

     This asynchronous function builds the appropriate URL using the loaded API key and provided ticker,
     sends a network request, and decodes the JSON response into a `GlobalQuote` model. The function performs
     checks for a valid URL, HTTP response, and non-empty data.

     - Parameter ticker: A `String` representing the stock ticker symbol.

     - Throws:
        - `StockAPIError.invalidURL` if the URL is malformed.
        - `StockAPIError.invalidResponse` if the HTTP response status code is not 200.
        - `StockAPIError.noTickerFound` if no valid stock data is returned.
        - `StockAPIError.invalidData` if the response data cannot be decoded.
     
     - Returns: A `GlobalQuote` instance containing the fetched stock data.
     */
    func fetchStockData(for ticker: String) async throws -> GlobalQuote {
        print("Fetching stock data for \(ticker)")
        let apiKey = try loadAPIKey()
        let urlString = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(ticker)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            throw StockAPIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw StockAPIError.invalidResponse
        }
        
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
           let globalQuote = json["Global Quote"] as? [String: Any],
           globalQuote.isEmpty {
              throw StockAPIError.noTickerFound
        }
        
        do {
            print("Data: \(String(data: data, encoding: .utf8) ?? "")")
            let quote = try JSONDecoder().decode(StockQuoteResponse.self, from: data)
            if quote.globalQuote.symbol == "" {
                throw StockAPIError.noTickerFound
            } else {
                return quote.globalQuote
            }
        } catch {
            throw StockAPIError.invalidData
        }
    }
}
