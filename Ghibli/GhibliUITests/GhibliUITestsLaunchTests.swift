//
//  GhibliUITestsLaunchTests.swift
//  GhibliUITests
//
//  Created by Tom Dobson on 12/15/25.
//

import XCTest

/// Captures a baseline screenshot every time the UI test target runs so layout changes are easy to review.
final class GhibliUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /// Launches the app and saves a screenshot attachment visible in the XCTest report.
    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
