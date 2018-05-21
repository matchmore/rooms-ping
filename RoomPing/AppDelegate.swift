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
        let config = MatchMoreConfig(apiKey: "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJpc3MiOiJhbHBzIiwic3ViIjoiMWNkMTVlMjEtOGQyOS00MTNiLWIwM2YtMTZmMWNiYjAxNTY4IiwiYXVkIjpbIlB1YmxpYyJdLCJuYmYiOjE1MjYxMzMxNDksImlhdCI6MTUyNjEzMzE0OSwianRpIjoiMSJ9.csdAaV0hI5InT_QIgwxZLYw5YpFgA05nFagnG2n-ujbiYJd7LJZ678sAySYndObr2UPGW0XjNqSE3tzQzxYmdw")
        
        Matchmore.configure(config)
        Matchmore.startUsingMainDevice { result in
            switch result {
            case .success:
                print("Using main device")
                Matchmore.startPollingMatches(pollingTimeInterval: 5)
                Matchmore.startRangingBeacons(updateTimeInterval: 5)
                // Matchmore.startUpdatingLocation()
            case let .failure(error):
                print(error.debugDescription)
            }
        }
        return true
    }
}

