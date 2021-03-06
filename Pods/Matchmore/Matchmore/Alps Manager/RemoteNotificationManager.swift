//
//  RemoteNotificationManager.swift
//  Matchmore
//
//  Created by Wen on 07.11.17.
//  Copyright © 2018 Matchmore SA. All rights reserved.
//

import Foundation

protocol RemoteNotificationManagerDelegate: class {
    func didReceiveMatchUpdateForDeviceId(deviceId: String)
    func didReceiveDeviceTokenUpdate(deviceToken: String)
}

let kTokenKey = "kTokenKey"
public class RemoteNotificationManager {
    private(set) weak var delegate: RemoteNotificationManagerDelegate?
    var deviceToken: String? {
        didSet {
            KeychainHelper.shared[kTokenKey] = deviceToken
        }
    }

    init(delegate: RemoteNotificationManagerDelegate) {
        deviceToken = KeychainHelper.shared[kTokenKey]
        self.delegate = delegate
    }

    func registerDeviceToken(deviceToken: String) {
        if self.deviceToken != deviceToken {
            self.deviceToken = deviceToken
            delegate?.didReceiveDeviceTokenUpdate(deviceToken: deviceToken)
        }
    }

    func process(pushNotification: [AnyHashable: Any]) {
        guard pushNotification["matchId"] != nil else { return }
        delegate?.didReceiveMatchUpdateForDeviceId(deviceId: "")
    }
}
