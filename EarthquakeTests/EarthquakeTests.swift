//
//  EarthquakeTests.swift
//  EarthquakeTests
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import XCTest
@testable import Earthquake

class EarthquakeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testEarthquakeInitialization(){
        let earthquake = Earthquake(earthquakeData: [
            "datetime" : "2010-10-25 12:42:22",
            "depth" : "20.6",
            "lat" : "-3.4841",
            "lng" : "100.1139",
            "magnitude" : "7.7"
        ])
        XCTAssertNotNil(earthquake)
    }
    
}
