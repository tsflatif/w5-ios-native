//
//  DBProvider.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-03-05.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class DBProvider {
    private static let _instance = DBProvider()
    
    static var Instance: DBProvider {
        return _instance
    }
    
    var REF_BASE: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var REF_USER: FIRDatabaseReference {
        return REF_BASE.child(USER)
    }
    
    var REF_RESTAURANTS: FIRDatabaseReference {
        return REF_BASE.child(RESTAURANTS)
    }
    
    var REF_GEO: FIRDatabaseReference {
        return REF_BASE.child(GEO)
    }
    
//    var REF_USERS: FIRDatabaseReference {
//        return REF_BASE.child("users")
//    }
    
//    var REF_USER_CURRENT: FIRDatabaseReference {
//        let uid = UserDefaults.standard.value(forKey: "uid") as! String
//        let user = URL_BASE.child("users").child(uid)
//        
//        return user
//    }
    
//    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
//        REF_USERS.child(uid).updateChildValues(user)
//    }
    
    func saveRestaurant(withID: String, restaurantName: String, restaurantID: String) {
        let data: Dictionary<String, Any> = [RESTAURANT_NAME: restaurantName, RESTAURANT_ID: restaurantID];
        REF_RESTAURANTS.child(withID).child(DATA).setValue(data);
    }
    
    func saveUser(withID: String, email: String, password: String) {
        let data: Dictionary<String, Any> = [EMAIL: email, PASSWORD: password];
        REF_USER.child(withID).child(DATA).setValue(data);
    }
    
}
