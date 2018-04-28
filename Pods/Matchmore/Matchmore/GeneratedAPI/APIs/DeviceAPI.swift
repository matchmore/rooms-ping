//
// DeviceAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire
import Foundation

open class DeviceAPI: APIBase {
    /**
     Create a device

     - parameter device: (body) The device to be created.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createDevice(device: Device, completion: @escaping ((_ data: Device?, _ error: Error?) -> Void)) {
        createDeviceWithRequestBuilder(device: device).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Create a device
     - POST /devices
     - examples: [{contentType=application/json, example={
     "deviceType" : { },
     "createdAt" : 0,
     "name" : "aeiou",
     "id" : "aeiou",
     "updatedAt" : 6,
     "group" : [ "first_group", "SecondGroup", "thirdGroup" ]
     }}]

     - parameter device: (body) The device to be created.

     - returns: RequestBuilder<Device>
     */
    open class func createDeviceWithRequestBuilder(device: Device) -> RequestBuilder<Device> {
        let path = "/devices"
        let URLString = AlpsAPI.basePath + path
        let parameters = device.encodeToJSON() as? [String: AnyObject]

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Device>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Create a new location for a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter location: (body) Location to create for a device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createLocation(deviceId: String, location: Location, completion: @escaping ((_ data: Location?, _ error: Error?) -> Void)) {
        createLocationWithRequestBuilder(deviceId: deviceId, location: location).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Create a new location for a device
     - POST /devices/{deviceId}/locations
     - examples: [{contentType=application/json, example={
     "createdAt" : 0,
     "altitude" : 5.962133916683182,
     "verticalAccuracy" : 2.3021358869347655,
     "latitude" : 6.027456183070403,
     "horizontalAccuracy" : 5.637376656633329,
     "longitude" : 1.4658129805029452
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter location: (body) Location to create for a device.

     - returns: RequestBuilder<Location>
     */
    open class func createLocationWithRequestBuilder(deviceId: String, location: Location) -> RequestBuilder<Location> {
        var path = "/devices/{deviceId}/locations"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters = location.encodeToJSON() as? [String: AnyObject]

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Location>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Create a publication for a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter publication: (body) Publication to create on a device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createPublication(deviceId: String, publication: Publication, completion: @escaping ((_ data: Publication?, _ error: Error?) -> Void)) {
        createPublicationWithRequestBuilder(deviceId: deviceId, publication: publication).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Create a publication for a device
     - POST /devices/{deviceId}/publications
     - examples: [{contentType=application/json, example={
     "duration" : 1.4658129805029452,
     "createdAt" : 0,
     "worldId" : "aeiou",
     "topic" : "aeiou",
     "range" : 6.027456183070403,
     "id" : "aeiou",
     "deviceId" : "aeiou",
     "properties" : ""
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter publication: (body) Publication to create on a device.

     - returns: RequestBuilder<Publication>
     */
    open class func createPublicationWithRequestBuilder(deviceId: String, publication: Publication) -> RequestBuilder<Publication> {
        var path = "/devices/{deviceId}/publications"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters = publication.encodeToJSON() as? [String: AnyObject]

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Publication>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Create a subscription for a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscription: (body) Subscription to create on a device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createSubscription(deviceId: String, subscription: Subscription, completion: @escaping ((_ data: Subscription?, _ error: Error?) -> Void)) {
        createSubscriptionWithRequestBuilder(deviceId: deviceId, subscription: subscription).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Create a subscription for a device
     - POST /devices/{deviceId}/subscriptions
     - examples: [{contentType=application/json, example={
     "duration" : 1.4658129805029452,
     "createdAt" : 0,
     "worldId" : "aeiou",
     "matchTTL" : 5.962133916683182,
     "matchDTL" : 5.637376656633329,
     "topic" : "aeiou",
     "range" : 6.027456183070403,
     "selector" : "aeiou",
     "pushers" : [ "aeiou" ],
     "id" : "aeiou",
     "deviceId" : "aeiou"
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscription: (body) Subscription to create on a device.

     - returns: RequestBuilder<Subscription>
     */
    open class func createSubscriptionWithRequestBuilder(deviceId: String, subscription: Subscription) -> RequestBuilder<Subscription> {
        var path = "/devices/{deviceId}/subscriptions"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters = subscription.encodeToJSON() as? [String: AnyObject]

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Subscription>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Delete an existing device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteDevice(deviceId: String, completion: @escaping ((_ error: Error?) -> Void)) {
        deleteDeviceWithRequestBuilder(deviceId: deviceId).execute { (_, error) -> Void in
            completion(error)
        }
    }

    /**
     Delete an existing device
     - DELETE /devices/{deviceId}

     - parameter deviceId: (path) The id (UUID) of the device.

     - returns: RequestBuilder<Void>
     */
    open class func deleteDeviceWithRequestBuilder(deviceId: String) -> RequestBuilder<Void> {
        var path = "/devices/{deviceId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Delete a Publication

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter publicationId: (path) The id (UUID) of the subscription.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deletePublication(deviceId: String, publicationId: String, completion: @escaping ((_ error: Error?) -> Void)) {
        deletePublicationWithRequestBuilder(deviceId: deviceId, publicationId: publicationId).execute { (_, error) -> Void in
            completion(error)
        }
    }

    /**
     Delete a Publication
     - DELETE /devices/{deviceId}/publications/{publicationId}
     -

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter publicationId: (path) The id (UUID) of the subscription.

     - returns: RequestBuilder<Void>
     */
    open class func deletePublicationWithRequestBuilder(deviceId: String, publicationId: String) -> RequestBuilder<Void> {
        var path = "/devices/{deviceId}/publications/{publicationId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{publicationId}", with: "\(publicationId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Delete a Subscription

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteSubscription(deviceId: String, subscriptionId: String, completion: @escaping ((_ error: Error?) -> Void)) {
        deleteSubscriptionWithRequestBuilder(deviceId: deviceId, subscriptionId: subscriptionId).execute { (_, error) -> Void in
            completion(error)
        }
    }

    /**
     Delete a Subscription
     - DELETE /devices/{deviceId}/subscriptions/{subscriptionId}
     -

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.

     - returns: RequestBuilder<Void>
     */
    open class func deleteSubscriptionWithRequestBuilder(deviceId: String, subscriptionId: String) -> RequestBuilder<Void> {
        var path = "/devices/{deviceId}/subscriptions/{subscriptionId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{subscriptionId}", with: "\(subscriptionId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Info about a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDevice(deviceId: String, completion: @escaping ((_ data: Device?, _ error: Error?) -> Void)) {
        getDeviceWithRequestBuilder(deviceId: deviceId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Info about a device
     - GET /devices/{deviceId}
     - examples: [{contentType=application/json, example={
     "deviceType" : { },
     "createdAt" : 0,
     "name" : "aeiou",
     "id" : "aeiou",
     "updatedAt" : 6,
     "group" : [ "first_group", "SecondGroup", "thirdGroup" ]
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.

     - returns: RequestBuilder<Device>
     */
    open class func getDeviceWithRequestBuilder(deviceId: String) -> RequestBuilder<Device> {
        var path = "/devices/{deviceId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Device>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get IBeacons triples for all registered devices

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getIBeaconTriples(completion: @escaping ((_ data: IBeaconTriples?, _ error: Error?) -> Void)) {
        getIBeaconTriplesWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get IBeacons triples for all registered devices
     - GET /devices/IBeaconTriples
     - Keys in map are device UUIDs and values are IBeacon triples. In model you can see example values \"property1\" \"property2\" \"property3\" instead of random UUIDs this is generated by OpenApi document browser
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<IBeaconTriples>
     */
    open class func getIBeaconTriplesWithRequestBuilder() -> RequestBuilder<IBeaconTriples> {
        let path = "/devices/IBeaconTriples"
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<IBeaconTriples>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get match for the device by its id

     - parameter deviceId: (path) The id (UUID) of the user device.
     - parameter matchId: (path) The id (UUID) of the match.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getMatch(deviceId: String, matchId: String, completion: @escaping ((_ data: Match?, _ error: Error?) -> Void)) {
        getMatchWithRequestBuilder(deviceId: deviceId, matchId: matchId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get match for the device by its id
     - GET /devices/{deviceId}/matches/{matchId}
     - examples: [{contentType=application/json, example={
     "createdAt" : 0,
     "publication" : {
     "duration" : 5.962133916683182,
     "createdAt" : 6,
     "worldId" : "aeiou",
     "topic" : "aeiou",
     "range" : 1.4658129805029452,
     "id" : "aeiou",
     "deviceId" : "aeiou",
     "properties" : ""
     },
     "id" : "aeiou",
     "subscription" : {
     "duration" : 7.061401241503109,
     "createdAt" : 5,
     "worldId" : "aeiou",
     "matchTTL" : 9.301444243932576,
     "matchDTL" : 3.616076749251911,
     "topic" : "aeiou",
     "range" : 2.3021358869347655,
     "selector" : "aeiou",
     "pushers" : [ "aeiou" ],
     "id" : "aeiou",
     "deviceId" : "aeiou"
     }
     }}]

     - parameter deviceId: (path) The id (UUID) of the user device.
     - parameter matchId: (path) The id (UUID) of the match.

     - returns: RequestBuilder<Match>
     */
    open class func getMatchWithRequestBuilder(deviceId: String, matchId: String) -> RequestBuilder<Match> {
        var path = "/devices/{deviceId}/matches/{matchId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{matchId}", with: "\(matchId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Match>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get matches for the device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getMatches(deviceId: String, completion: @escaping ((_ data: Matches?, _ error: Error?) -> Void)) {
        getMatchesWithRequestBuilder(deviceId: deviceId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get matches for the device
     - GET /devices/{deviceId}/matches
     - examples: [{contentType=application/json, example=""}]

     - parameter deviceId: (path) The id (UUID) of the device.

     - returns: RequestBuilder<Matches>
     */
    open class func getMatchesWithRequestBuilder(deviceId: String) -> RequestBuilder<Matches> {
        var path = "/devices/{deviceId}/matches"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Matches>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Info about a publication on a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter publicationId: (path) The id (UUID) of the publication.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getPublication(deviceId: String, publicationId: String, completion: @escaping ((_ data: Publication?, _ error: Error?) -> Void)) {
        getPublicationWithRequestBuilder(deviceId: deviceId, publicationId: publicationId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Info about a publication on a device
     - GET /devices/{deviceId}/publications/{publicationId}
     - examples: [{contentType=application/json, example={
     "duration" : 1.4658129805029452,
     "createdAt" : 0,
     "worldId" : "aeiou",
     "topic" : "aeiou",
     "range" : 6.027456183070403,
     "id" : "aeiou",
     "deviceId" : "aeiou",
     "properties" : ""
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter publicationId: (path) The id (UUID) of the publication.

     - returns: RequestBuilder<Publication>
     */
    open class func getPublicationWithRequestBuilder(deviceId: String, publicationId: String) -> RequestBuilder<Publication> {
        var path = "/devices/{deviceId}/publications/{publicationId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{publicationId}", with: "\(publicationId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Publication>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get all publications for a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getPublications(deviceId: String, completion: @escaping ((_ data: Publications?, _ error: Error?) -> Void)) {
        getPublicationsWithRequestBuilder(deviceId: deviceId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get all publications for a device
     - GET /devices/{deviceId}/publications
     - examples: [{contentType=application/json, example=""}]

     - parameter deviceId: (path) The id (UUID) of the device.

     - returns: RequestBuilder<Publications>
     */
    open class func getPublicationsWithRequestBuilder(deviceId: String) -> RequestBuilder<Publications> {
        var path = "/devices/{deviceId}/publications"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Publications>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Info about a subscription on a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSubscription(deviceId: String, subscriptionId: String, completion: @escaping ((_ data: Subscription?, _ error: Error?) -> Void)) {
        getSubscriptionWithRequestBuilder(deviceId: deviceId, subscriptionId: subscriptionId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Info about a subscription on a device
     - GET /devices/{deviceId}/subscriptions/{subscriptionId}
     - examples: [{contentType=application/json, example={
     "duration" : 1.4658129805029452,
     "createdAt" : 0,
     "worldId" : "aeiou",
     "matchTTL" : 5.962133916683182,
     "matchDTL" : 5.637376656633329,
     "topic" : "aeiou",
     "range" : 6.027456183070403,
     "selector" : "aeiou",
     "pushers" : [ "aeiou" ],
     "id" : "aeiou",
     "deviceId" : "aeiou"
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.

     - returns: RequestBuilder<Subscription>
     */
    open class func getSubscriptionWithRequestBuilder(deviceId: String, subscriptionId: String) -> RequestBuilder<Subscription> {
        var path = "/devices/{deviceId}/subscriptions/{subscriptionId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{subscriptionId}", with: "\(subscriptionId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Subscription>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get all subscriptions for a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSubscriptions(deviceId: String, completion: @escaping ((_ data: Subscriptions?, _ error: Error?) -> Void)) {
        getSubscriptionsWithRequestBuilder(deviceId: deviceId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get all subscriptions for a device
     - GET /devices/{deviceId}/subscriptions
     - examples: [{contentType=application/json, example=""}]

     - parameter deviceId: (path) The id (UUID) of the device.

     - returns: RequestBuilder<Subscriptions>
     */
    open class func getSubscriptionsWithRequestBuilder(deviceId: String) -> RequestBuilder<Subscriptions> {
        var path = "/devices/{deviceId}/subscriptions"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Subscriptions>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Trigger the proximity event between a device and a ranged BLE iBeacon

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter proximityEvent: (body) The proximity event to be created for the device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func triggerProximityEvents(deviceId: String, proximityEvent: ProximityEvent, completion: @escaping ((_ data: ProximityEvent?, _ error: Error?) -> Void)) {
        triggerProximityEventsWithRequestBuilder(deviceId: deviceId, proximityEvent: proximityEvent).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Trigger the proximity event between a device and a ranged BLE iBeacon
     - POST /devices/{deviceId}/proximityEvents
     - examples: [{contentType=application/json, example={
     "createdAt" : 0,
     "distance" : 6.027456183070403,
     "id" : "aeiou",
     "deviceId" : "aeiou"
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter proximityEvent: (body) The proximity event to be created for the device.

     - returns: RequestBuilder<ProximityEvent>
     */
    open class func triggerProximityEventsWithRequestBuilder(deviceId: String, proximityEvent: ProximityEvent) -> RequestBuilder<ProximityEvent> {
        var path = "/devices/{deviceId}/proximityEvents"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters = proximityEvent.encodeToJSON() as? [String: AnyObject]

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ProximityEvent>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Updates name or/and device token for existing device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter device: (body) The device update description.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateDevice(deviceId: String, device: DeviceUpdate, completion: @escaping ((_ data: Device?, _ error: Error?) -> Void)) {
        updateDeviceWithRequestBuilder(deviceId: deviceId, device: device).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Updates name or/and device token for existing device
     - PATCH /devices/{deviceId}
     - Token can be only updated for mobile devices.
     - examples: [{contentType=application/json, example={
     "deviceType" : { },
     "createdAt" : 0,
     "name" : "aeiou",
     "id" : "aeiou",
     "updatedAt" : 6,
     "group" : [ "first_group", "SecondGroup", "thirdGroup" ]
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter device: (body) The device update description.

     - returns: RequestBuilder<Device>
     */
    open class func updateDeviceWithRequestBuilder(deviceId: String, device: DeviceUpdate) -> RequestBuilder<Device> {
        var path = "/devices/{deviceId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters = device.encodeToJSON() as? [String: AnyObject]

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Device>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
