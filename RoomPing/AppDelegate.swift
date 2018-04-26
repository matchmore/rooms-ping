//
//  AppDelegate.swift
//  RoomPing
//
//  Created by Maciej Burda on 25/04/2018.
//  Copyright © 2018 Matchmore SA. All rights reserved.
//

import UIKit
import Matchmore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Get your API_KEY at Matchmore.io
        let config = MatchMoreConfig(apiKey: "API_KEY")
        Matchmore.configure(config)
        Matchmore.startUsingMainDevice { result in
            switch result {
            case .success:
                print("Using main device")
                Matchmore.startPollingMatches(pollingTimeInterval: 5)
                Matchmore.startRangingBeacons(updateTimeInterval: 5)
                Matchmore.startUpdatingLocation()
            case let .failure(error):
                print(error.debugDescription)
            }
        }
        return true
    }
}

