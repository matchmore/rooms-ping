//
// ProximityEvent.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

/** A proximity event is triggered to the core when a mobile device detects an iBeacon device in his Bluetooth Low Energy(BLE) range.  */
open class ProximityEvent: JSONEncodable {
    /** The id (UUID) of the proximity event. */
    public var id: String?
    /** The timestamp of the proximity event in seconds since Jan 01 1970 (UTC).  */
    public var createdAt: Int64?
    /** The id (UUID) of the iBeacon to trigger a proximity event to. */
    public var deviceId: String?
    /** Distance between the mobile device that trigger the proximity event and the ranged iBeacon. This distance is automatically generated by the SDK based upon the CLProximity.  */
    public var distance: Double?

    public init() {}

    // MARK: JSONEncodable

    open func encodeToJSON() -> Any {
        var nillableDictionary = [String: Any?]()
        nillableDictionary["id"] = id
        nillableDictionary["createdAt"] = createdAt?.encodeToJSON()
        nillableDictionary["deviceId"] = deviceId
        nillableDictionary["distance"] = distance

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
