//
//  Resturant.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-20.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import Firebase

class Restaurant {
    private var _restaurantKey: String!
    private var _restaurantName: String!
    private var _restaurantAddress: String!
    private var _restaurantTime: String!
    private var _walkTime: String!
    private var _walkMinutes: Int!
    private var _imageUrl: String?
    private var _isFoodCourt: Bool?
    private var _postRef: FIRDatabaseReference!
    
    var restaurantKey: String {
        get {
            return _restaurantKey
        }
        set {
            _restaurantKey = newValue
        }
    }
    
    var restaurantName: String {
        get {
            return _restaurantName
        }
        set {
            _restaurantName = newValue
        }
    }
    
    var restaurantAdress: String {
        get {
            return _restaurantAddress
        }
        set {
            _restaurantAddress = newValue
        }
    }
    
    var restaurantTime: String {
        get {
            return _restaurantTime
        }
        set {
            _restaurantTime = newValue
        }
    }
    
    var walkTime: String {
        get {
            return _walkTime
        }
        set {
            _walkTime = newValue
        }
    }
    
    var walkMinutes: Int {
        get {
            return _walkMinutes
        }
        set {
            _walkMinutes = newValue
        }
    }
    
    var imageUrl: String? {
        get {
            return _imageUrl
        }
        set {
            _imageUrl = newValue
        }
    }
    
    var isFoodCourt: Bool? {
        get {
            return _isFoodCourt
        }
        set {
            _isFoodCourt = newValue
        }
    }
    
    init(restaurantName: String, restaurantAdress: String, restaurantTime: Int, restaurantImage: String){
        self._restaurantName = restaurantName
        self._restaurantAddress = restaurantAdress
        self._restaurantTime = checkIfOpen(restaurantTime: restaurantTime)
        self._imageUrl = restaurantImage
    }
    
    init(restaurantKey: String, dictionary: Dictionary<String, AnyObject>, userLocation: CLLocation) {
        self._restaurantKey = restaurantKey
        
        if let restaurantName = dictionary[RESTAURANT_NAME] as? String {
            self._restaurantName = restaurantName
        }
        
        if let restaurantAddress = dictionary["address_1"] as? String {
            self._restaurantAddress = restaurantAddress
        }
        
        //if let resturantTime = dictionary["restaurant_time"] as? String {
        self._restaurantTime = checkIfOpen(restaurantTime: 2230)
        //self._walkTime = checkDistance()
        //}
        
        if let latitude = dictionary["l"]?["latitude"] as? Double, let longitude = dictionary["l"]?["longitude"] as? Double {
            self._walkMinutes = checkDistance(toLatitude: latitude,
                                              toLongitude: longitude,
                                              userLatitude: userLocation.coordinate.latitude,
                                              userLongitude: userLocation.coordinate.longitude)
            self._walkTime = "\(walkMinutes) mins walk"
        }
        
        if let isFoodCourt = dictionary["is_foodcourt"] as? Bool {
            self._isFoodCourt = isFoodCourt
        }
        
        if let imgUrl = dictionary["restaurant_image"] as? String {
            self._imageUrl = imgUrl
        }
        
        self._postRef = DBProvider.Instance.REF_RESTAURANTS.child(self._restaurantKey)
    }
    
    func checkIfOpen(restaurantTime: Int) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let currentTime = dateFormatter.string(from: date as Date)
        
        if (restaurantTime - Int(currentTime)!) < 0 {
            return "CLOSED"
        } else if (restaurantTime - Int(currentTime)!) < 30 {
            return "CLOSING SOON"
        }
        else { return "OPEN" }
        
    }
    
    func checkDistance(toLatitude: Double, toLongitude: Double, userLatitude: Double, userLongitude: Double) -> Int{
        let toLocation = CLLocation(latitude: toLatitude, longitude: toLongitude)
        let fromLocation = CLLocation(latitude: userLatitude, longitude: userLongitude)
        
        let distanceInMeters = toLocation.distance(from: fromLocation)
        let walkMinutes = lround(distanceInMeters / (5000/60))
        
        return walkMinutes
    }
}
