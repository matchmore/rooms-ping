//
//  ViewController.swift
//  RoomPing
//
//  Created by Maciej Burda on 25/04/2018.
//  Copyright © 2018 Matchmore SA. All rights reserved.
//

import UIKit
import Matchmore

class ViewController: UIViewController, MatchDelegate {
    @IBOutlet weak var roomOneCountLabel: UILabel!
    @IBOutlet weak var roomTwoCountLabel: UILabel!
    
    var onMatch: OnMatchClosure?
    
    var rooms = [
        "255f7085-fa2b-4603-8a07-3cf89b848c1a": 0,
        "8f1ebd5f-1b8a-46bc-a532-2f88bf60a558": 0
        ] {
        didSet {
            roomOneCountLabel.text = String(rooms["255f7085-fa2b-4603-8a07-3cf89b848c1a"] ?? 0)
            roomTwoCountLabel.text = String(rooms["8f1ebd5f-1b8a-46bc-a532-2f88bf60a558"] ?? 0)
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
            let pub = Publication(topic: "rooms", range: 1, duration: 99999, properties: [:])
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
                let roomsSub = Subscription(topic: "rooms", range: 50, duration: 99999, selector: "")
                roomsSub.matchTTL = 10
                roomsSub.matchDTL = 0
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
