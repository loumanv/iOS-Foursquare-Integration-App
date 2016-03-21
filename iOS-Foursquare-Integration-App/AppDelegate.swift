//
//  AppDelegate.swift
//  iOS-Foursquare-Integration-App
//
//  Created by Vasileios Loumanis on 21/03/2016.
//  Copyright © 2016 Vasileios Loumanis. All rights reserved.
//

import UIKit
import QuadratTouch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let client = Client(clientID: "5ML3MWYZS1FHVCP0YEAJKXFABXJEEPKJHKBMYOAK0VEE1FTR",
            clientSecret: "H4BLAFYKN5Z2XZHEMYTHJYMW1R5ZIPW1FAZQO2KDUT2BH25N",
            redirectURL: "ios-app://redirect")
        var configuration = Configuration(client:client)
        configuration.mode = "foursquare"
        Session.setupSharedSessionWithConfiguration(configuration)
        return true
    }
}

