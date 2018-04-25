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
        
        let config = MatchMoreConfig(apiKey: "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJpc3MiOiJhbHBzIiwic3ViIjoiYTAyNjI5NDUtOTU1NC00YmFkLTlmNWUtZDZmM2Q2ODE1MWMwIiwiYXVkIjpbIlB1YmxpYyJdLCJuYmYiOjE1MjQ2NDgzMzAsImlhdCI6MTUyNDY0ODMzMCwianRpIjoiMSJ9.3-7vCYGIlHhBtZ9eKsZmkW3LTdnbL37T8d8i5IGbdACyE6agHuvika-7u19ZugPfaGJz3AUP26IeEFEwZWQCdQ")
        Matchmore.configure(config)
        Matchmore.startUsingMainDevice { result in
            switch result {
            case .success:
                print("Using main device")
            case let .failure(error):
                print(error.debugDescription)
            }
        }
        Matchmore.startPollingMatches(pollingTimeInterval: 5)
        Matchmore.startRangingBeacons(updateTimeInterval: 5)
        return true
    }
}

