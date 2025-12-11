//
//  NavigationPage.swift
//  SwiftNav
//
//  Created by Tom Dobson on 12/11/25.
//

import SwiftUI

/// Identifiers for the destinations that can appear in the navigation stack.
///
/// Using an enum here lets us keep the navigation type-safe when working
/// with `NavigationPath` and `.navigationDestination(for:)`.
enum NavigationPage: Hashable {
    case orangePage, redPage
}
