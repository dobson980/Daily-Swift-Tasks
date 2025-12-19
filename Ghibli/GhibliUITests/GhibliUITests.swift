//
//  GhibliUITests.swift
//  GhibliUITests
//
//  Created by Tom Dobson on 12/15/25.
//

import XCTest

/// Placeholder UI test suite showing where to automate tab navigation and favorites interactions.
final class GhibliUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Nothing to clean up yet, but the override is ready for future per-test teardown.
    }

    /// Basic smoke test to ensure the app launches for interactive debugging.
    @MainActor
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        // TODO: Add assertions navigating through tabs/favorites as the UI test suite grows.
    }

    /// Captures a launch-time performance metric so regressions are easy to spot in CI.
    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
