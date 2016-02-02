//
//  FormatterTests.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/2/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import XCTest
@testable import Earthquake

class FormatterTests: XCTestCase {
    var formatter: Formatter!
    let dateTime = "2015-05-30 11:36:00"
    static let formattedDateTime = "May 30, 2015 11:36"
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        formatter = Formatter()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDateTimeFormatter(){
        let formattedDateTime = formatter.dateTime(dateTime)
        XCTAssertEqual(formattedDateTime, FormatterTests.formattedDateTime)
    }

}
