//
//  ContentView.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/24/25.
//

import SwiftUI

/**
 A view that displays the main interface for the SwiftStock app.

 This view leverages the environment object `StockViewModel` to manage and display stock data or present an error banner.
 */
struct ContentView: View {
    /// The environment object providing stock data and actions.
    @EnvironmentObject var viewModel: StockViewModel
    
    /// An instance of `AlphavantageService` for API interactions (currently not used in the view logic).
    let apiService = AlphavantageService()
    
    /**
     The body property presents the view's content.
     
     - If a valid stock quote exists, it displays the stock details along with a button to clear the data.
     - Otherwise, it shows an error banner overlaid on a text field, where users can input a stock symbol.
     */
    var body: some View {
        VStack {
            // Display stock details when available.
            if let stockQuote = viewModel.stockQuote {
                StockDetails(stockData: stockQuote)
                Button("Cear Data") {
                    viewModel.clearData()
                }
                .buttonStyle(.borderedProminent)
            } else {
                // Present error message and input field when no stock data is available.
                ZStack {
                    ErrorBanner(isShowing: $viewModel.presentError, errorText: viewModel.errorMessage)
                    VStack {
                        Spacer()
                        // Text field for entering the stock ticker symbol.
                        TextField("Enter a stock symbol", text: $viewModel.stockSymbol)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onSubmit {
                                // Trigger a stock data fetch when the user submits the symbol.
                                Task {
                                    await viewModel.fetchStockData()
                                }
                            }
                    }
                }
            }
        }
        .padding()
    }
}

/**
 A preview provider for Xcode Canvas to showcase `ContentView`.
 
 The preview injects an instance of `StockViewModel` into the environment to simulate application behavior.
 */
#Preview {
    ContentView()
        .environmentObject(StockViewModel())
}
