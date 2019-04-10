//
//  ViewController.swift
//  RoomPing
//
//  Created by Maciej Burda on 25/04/2018.
//  Copyright © 2018 Matchmore SA. All rights reserved.
//

import UIKit
import Matchmore
import CoreLocation

class ViewController: UIViewController, MatchDelegate {
    @IBOutlet weak var roomOneCountLabel: UILabel!
    @IBOutlet weak var roomTwoCountLabel: UILabel!
    
    var onMatch: OnMatchClosure?
    
    // These are id's iBeacons devices known by the Matchmore cloud. Note, that Matchmore id is something different from beacon's uuid.
    // You can add your own beacon devices here https://matchmore.io
    var rooms = [
        "f33fd436-f60c-43b7-9219-01d9431878c7": 0,
        "c98f9436-39fe-4507-9c03-44f0359d0762": 0
        ] {
        didSet {
            roomOneCountLabel.text = String(rooms["f33fd436-f60c-43b7-9219-01d9431878c7"] ?? 0)
            roomTwoCountLabel.text = String(rooms["c98f9436-39fe-4507-9c03-44f0359d0762"] ?? 0)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        onMatch = { matches, _ in
            matches.forEach {
                if let roomKey = $0.publication?.deviceId {
                    let value = self.rooms[roomKey] ?? 0
                    self.rooms[roomKey] = value + 1
                }
            }
        }
        Matchmore.matchDelegates += self
    }
    
    @IBAction func deployRooms() {
        Matchmore.publications.findAll(completion: {
            if $0.isEmpty {
                self.deployRooms(Array(self.rooms.keys))
            } else {
                print("rooms already deployed")
            }
        })
    }
    
    func deployRooms(_ beaconIds: [String]) {
        beaconIds.forEach { beaconId in
            let iBeaconTriple = IBeaconTriple()
            iBeaconTriple.deviceId = beaconId
            let pub = Publication(topic: "rooms", range: 3, duration: 99999, properties: ["other_data":1])
            Matchmore.createPublication(publication: pub, forBeacon: iBeaconTriple) { result in
                switch result {
                case .success:
                    print("Room with \(beaconId) deployed")
                case let .failure(error):
                    print(error.debugDescription)
                }
            }
        }
    }
    
    @IBAction func startReportingRooms() {
        Matchmore.subscriptions.findAll(completion: {
            if $0.isEmpty {
                let roomsSub = Subscription(topic: "rooms", range: 1, duration: 99999, selector: "other_data = 1")
                Matchmore.createSubscriptionForMainDevice(subscription: roomsSub, completion: { (result) in
                    switch result {
                    case .success:
                        print("getting rooms matches...")
                    case let .failure(error):
                        print(error.debugDescription)
                    }
                })
            } else {
                print("already getting rooms matches.")
            }
        })
    }
}

