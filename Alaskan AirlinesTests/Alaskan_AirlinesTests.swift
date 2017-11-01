//
//  Alaskan_AirlinesTests.swift
//  Alaskan AirlinesTests
//
//  Created by Abraham Tesfamariam on 10/31/17.
//  Copyright © 2017 RJT Compuquest. All rights reserved.
//

import XCTest
@testable import Alaskan_Airlines

class Alaskan_AirlinesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPreviousAirportSaved() {
        let defaults = UserDefaults.standard
        XCTAssertNotNil(defaults.string(forKey: "previousAirportSearch"))
    }
    
    func testFlightsListTimestampAndServiceCall() {
        self.measure {
            let flightsServiceCallExpectation = expectation(description: "fetchFlights")
            
            FlightService.shared.fetchFlights(airport: "LAX", pastMinutes: 5, futureMinutes: 100) { (flights) in
                
                flightsServiceCallExpectation.fulfill()
            }
            
            waitForExpectations(timeout: 10, handler: { (error) in
                XCTAssertNil(error)
            })
        }
        
    }
    
}
