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
    static let dateTime = "2010-10-25 12:42:22"
    static let lat: Double = -3.4841
    static let lng: Double = 100.1139
    static let magnitude: Double = 7.7
    
    var earthquake: Earthquake!
    let jsonData: NSDictionary = [
        "datetime" : "2010-10-25 12:42:22",
        "lat" : -3.4841,
        "lng" : 100.1139,
        "magnitude" : 7.7]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        earthquake = Earthquake(earthquakeData: jsonData)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testEarthquakeInitializationFromDictionary(){
        XCTAssertNotNil(earthquake, "An Earthquake object cannot be nil")
    }
    func testDateTimeAssignment(){
        XCTAssertEqual(earthquake.dateTimeString, EarthquakeTests.dateTime)
    }
    func testLatitudeAssignment(){
        XCTAssertEqual(earthquake.latitude, EarthquakeTests.lat)
    }
    func testLongitudeAssignment(){
        XCTAssertEqual(earthquake.longitude, EarthquakeTests.lng)
    }
    func testMagnitudeAssignment(){
        XCTAssertEqual(earthquake.magnitude, EarthquakeTests.magnitude)
    }
}
