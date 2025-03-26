//
//  Untitled.swift
//  SwiftStock
//
//  Created by Thomas Dobson on 3/25/25.
//
import Foundation

enum LoadAPIKeyError: Error {
    case fileNotFound
    case dictionaryNotFound
    case apiKeyNotFound
}
