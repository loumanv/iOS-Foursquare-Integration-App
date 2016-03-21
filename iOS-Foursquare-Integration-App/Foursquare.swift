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

protocol FoursquareDelegate {
    func searchFinished()
}

class Foursquare: NSObject {

    var venues: [JSONParameters]!
    var delegate: FoursquareDelegate?
    
    func search(location: NSString) {
        let session = Session.sharedSession()
        let whitespaceCharacterSet = NSCharacterSet.whitespaceCharacterSet()
        let locationStrippedString = location.stringByTrimmingCharactersInSet(whitespaceCharacterSet)
        let parameters = [Parameter.near:locationStrippedString]
        let searchTask = session.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                self.venues = response["venues"] as! [JSONParameters]?
                if let delegate = self.delegate {
                    delegate.searchFinished()
                }
            }
        }
        searchTask.start()
    }
}
