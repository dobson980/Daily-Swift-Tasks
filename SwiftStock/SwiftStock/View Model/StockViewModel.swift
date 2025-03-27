//
//  StockViewModel.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/26/25.
//

import Foundation
import SwiftUI

/**
 A view model responsible for managing stock data and error state for the SwiftStock app.
 
 This class conforms to the ObservableObject protocol to allow SwiftUI views to react to changes.
 It fetches stock data using the AlphavantageService and exposes published properties to update the UI.
 */
class StockViewModel: ObservableObject {
    
    /// The entered stock ticker symbol.
    @Published var stockSymbol: String = ""
    
    /// The fetched stock quote data represented by a GlobalQuote model.
    @Published var stockQuote: GlobalQuote?
    
    /// A boolean flag indicating whether an error alert should be presented.
    @Published var presentError: Bool = false
    
    /// A message describing the current error.
    @Published var errorMessage: String = ""
    
    /// An instance of AlphavantageService to handle API calls.
    private let apiService = AlphavantageService()
        
    /**
     Asynchronously fetches the stock data for the symbol stored in `stockSymbol`.
     
     This function calls the API service and attempts to retrieve a GlobalQuote. It handles API key 
     loading errors (LoadAPIKeyError) and stock data errors (StockAPIError), updating the error state accordingly.
     */
    func fetchStockData() async {
        do {
            stockQuote = try await apiService.fetchStockData(for: stockSymbol)
        } catch let apiLoadError as LoadAPIKeyError {
            switch apiLoadError {
            case .fileNotFound:
                presentError.toggle()
                errorMessage = "API Key File Not Found"
            case .dictionaryNotFound:
                presentError.toggle()
                errorMessage = "API Key Not Found"
            case .apiKeyNotFound:
                presentError.toggle()
                errorMessage = "API Key Not Found"
            }
        } catch let apiError as StockAPIError {
            switch apiError {
            case .invalidURL:
                presentError.toggle()
                errorMessage = "Invalid URL"
            case .invalidResponse:
                presentError.toggle()
                errorMessage = "Invalid Response"
            case .noTickerFound:
                presentError.toggle()
                errorMessage = "Invalid stock symbol"
            case .invalidData:
                presentError.toggle()
                errorMessage = "Invalid Data"
            }
        } catch {
            print("Unexpected Error: \(error)")
        }
    }
    
    /**
     Clears the current stock data and resets the stock symbol.
     
     This method resets both the `stockQuote` and `stockSymbol` properties, effectively clearing the view model's state.
     */
    func clearData(){
        stockQuote = nil
        stockSymbol = ""
    }
}
