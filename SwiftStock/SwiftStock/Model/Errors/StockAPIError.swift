//
//  StockAPIError.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/25/25.
//

import Foundation

enum StockAPIError: Error {
    case invalidURL
    case invalidResponse
    case noTickerFound
    case invalidData
}
