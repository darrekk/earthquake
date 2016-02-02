//
//  EarthquakeUITests.swift
//  EarthquakeUITests
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import XCTest

@testable import Earthquake

class EarthquakeUITests: XCTestCase {
    var viewController: EarthquakeViewController!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        viewController = EarthquakeViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerHasTableVIew(){
        XCTAssertNotNil(viewController.tableView, "View controller should have a tableView")
    }
    
}
