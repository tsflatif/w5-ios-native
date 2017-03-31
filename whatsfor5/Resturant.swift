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

class Resturant {
    private var _resturantKey: String!
    private var _resturantName: String!
    private var _resturantAddress: String!
    private var _resturantTime: String!
    private var _walkTime: String!
    private var _walkMinutes: Int!
    private var _imageUrl: String?
    private var _isFoodCourt: Bool?
    private var _postRef: FIRDatabaseReference!
    
    var resturantKey: String {
        get {
            return _resturantKey
        }
        set {
            _resturantKey = newValue
        }
    }
    
    var resturantName: String {
        get {
            return _resturantName
        }
        set {
            _resturantName = newValue
        }
    }
    
    var resturantAdress: String {
        get {
            return _resturantAddress
        }
        set {
            _resturantAddress = newValue
        }
    }
    
    var resturantTime: String {
        get {
            return _resturantTime
        }
        set {
            _resturantTime = newValue
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
    
    init(resturantName: String, resturantAdress: String, resturantTime: Int, resturantImage: String){
        self._resturantName = resturantName
        self._resturantAddress = resturantAdress
        self._resturantTime = checkIfOpen(resturantTime: resturantTime)
        //self._walkTime = checkDistance()
        self._imageUrl = resturantImage
    }
    
    init(resturantKey: String, dictionary: Dictionary<String, AnyObject>) {
        self._resturantKey = resturantKey
        
        if let resturantName = dictionary[RESTURANT_NAME] as? String {
            self._resturantName = resturantName
        }
        
        if let resturantAddress = dictionary["address_1"] as? String {
            self._resturantAddress = resturantAddress
        }
        
        //if let resturantTime = dictionary["resturant_time"] as? String {
        self._resturantTime = checkIfOpen(resturantTime: 2230)
        //self._walkTime = checkDistance()
        //}
        
        if let latitude = dictionary["l"]?["latitude"] as? Double, let longitude = dictionary["l"]?["longitude"] as? Double {
            print(latitude)
            print(longitude)
            print("This is ludacrishno")
            self._walkMinutes = checkDistance(latitude: latitude, longitude: longitude)
            self._walkTime = "\(walkMinutes) mins walk"
        }
        
        if let isFoodCourt = dictionary["is_foodcourt"] as? Bool {
            self._isFoodCourt = isFoodCourt
        }
        
        if let imgUrl = dictionary["resturant_image"] as? String {
            self._imageUrl = imgUrl
        }
        
        self._postRef = DBProvider.Instance.REF_RESTURANTS.child(self._resturantKey)
    }
    
    func checkIfOpen(resturantTime: Int) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let currentTime = dateFormatter.string(from: date as Date)
        
        if (resturantTime - Int(currentTime)!) < 0 {
            return "CLOSED"
        } else if (resturantTime - Int(currentTime)!) < 30 {
            return "CLOSING SOON"
        }
        else { return "OPEN" }
        
    }
    
    func checkDistance(latitude: Double, longitude: Double) -> Int{
        let toLocation = CLLocation(latitude: latitude, longitude: longitude)
        let fromLocation = CLLocation(latitude: 43.7071896, longitude: -79.3416318)
        
//        let locationManager = CLLocationManager()
//        
//        // Ask for Authorisation from the User.
//        locationManager.requestAlwaysAuthorization()
//        
//        // For use in foreground
//        locationManager.requestWhenInUseAuthorization()
//        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = CLLocationManagerDelegate
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//        }
        
        //let distanceInMeters = coordinate₀.distance(from: coordinate₁) // result is in meters
        let distanceInMeters = toLocation.distance(from: fromLocation)
        let walkMinutes = lround(distanceInMeters / (5000/60))
        
        //return ("\(walkMinutes) mins walk")
        return walkMinutes
    }
}
