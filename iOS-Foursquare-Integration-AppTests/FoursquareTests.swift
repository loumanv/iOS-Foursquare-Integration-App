//
//  FoursquareTests.swift
//  iOS-Foursquare-Integration-App
//
//  Created by Vasileios Loumanis on 21/03/2016.
//  Copyright © 2016 Vasileios Loumanis. All rights reserved.
//

import XCTest

class FoursquareTests: XCTestCase {
    
    var foursquare: Foursquare = Foursquare()
    
    func testUserOrdersAreRetrievedFromApiAndProcessed() {
        
        let asyncExpectation = expectationWithDescription("RetrievingFoursquareResults")
        foursquare.search("London") { () -> Void in
            asyncExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNotNil(self.foursquare.venues, "Venues should not be nil")
        }
    }
}
