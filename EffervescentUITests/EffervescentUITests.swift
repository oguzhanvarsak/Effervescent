//
//  EffervescentUITests.swift
//  EffervescentUITests
//
//  Created by Oğuzhan Varsak on 12.11.2021.
//

import XCTest

class EffervescentUITests: XCTestCase {
    override func setUp() {
            super.setUp()
            
            continueAfterFailure = false
            
            let app = XCUIApplication()
            setupSnapshot(app)
            app.launch()
        }
        
    func testGenerateScreenshots() {
        let app = XCUIApplication()

        snapshot("BoardsViewController")
        sleep(1)
        
        app.tables["tableView"].cells.element(boundBy: 0).tap()
        
        sleep(3)
        
        snapshot("MainViewController")
    }
}
