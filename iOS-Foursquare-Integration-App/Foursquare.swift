//
//  Foursquare.swift
//  iOS-Foursquare-Integration-App
//
//  Created by Vasileios Loumanis on 21/03/2016.
//  Copyright © 2016 Vasileios Loumanis. All rights reserved.
//

import UIKit
import QuadratTouch

typealias JSONParameters = [String: AnyObject]

class Foursquare: NSObject {

    var venues: [JSONParameters]!
    
    func search(location: NSString) {
        let session = Session.sharedSession()
        let whitespaceCharacterSet = NSCharacterSet.whitespaceCharacterSet()
        let locationStrippedString = location.stringByTrimmingCharactersInSet(whitespaceCharacterSet)
        let parameters = [Parameter.near:locationStrippedString]
        let searchTask = session.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                self.venues = response["venues"] as! [JSONParameters]?
            }
        }
        searchTask.start()
    }
}
