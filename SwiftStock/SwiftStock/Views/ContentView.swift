//
//  ContentView.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var stockSymbol = ""
    @State private var stockQuote: GlobalQuote?
    @State private var presentError = false
    @State private var errorMessage = ""
    var body: some View {
        VStack {
            if stockQuote != nil {
                Spacer()
                Text("Stock Symbol: \(stockQuote?.symbol ?? "")")
                Text("Open: \(stockQuote?.open ?? "")")
                Text("High: \(stockQuote?.high ?? "")")
                Text("Low: \(stockQuote?.low ?? "")")
                Text("Price: \(stockQuote?.price ?? "")")
                Text("Volume: \(stockQuote?.volume ?? "")")
                Text("Change: \(stockQuote?.changePercent ?? "")")
                Spacer()
                Button("Clear") {
                    stockQuote = nil
                    stockSymbol = ""
                }.buttonStyle(.borderedProminent)
            } else {
                ZStack {
                    ErrorBanner(isShowing: $presentError, errorText: errorMessage)
                    VStack {
                        Spacer()
                        TextField("Enter a stock symbol", text: $stockSymbol)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onSubmit {
                                Task {
                                    do {
                                        stockQuote = try await fetchStockData(for: stockSymbol)
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
                            }
                    }
                }
            }
        }
        .padding()
    }
    
    func loadAPIKey() throws -> String {
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

enum LoadAPIKeyError: Error {
    case fileNotFound
    case dictionaryNotFound
    case apiKeyNotFound
}

enum StockAPIError: Error {
    case invalidURL
    case invalidResponse
    case noTickerFound
    case invalidData
}

struct GlobalQuote: Decodable {
    var symbol: String
    var open: String
    var high: String
    var low: String
    var price: String
    var volume: String
    var change: String
    var changePercent: String
    
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

struct StockQuoteResponse: Decodable {
    let globalQuote: GlobalQuote
    
    enum CodingKeys: String, CodingKey {
        case globalQuote = "Global Quote"
    }
}

#Preview {
    ContentView()
}
