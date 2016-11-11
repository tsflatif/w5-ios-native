//
//  Resturant.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-20.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import Foundation

class Resturant {
    fileprivate var _resturantName: String!
    fileprivate var _resturantID: Int!
    
    var resturantName: String {
        return _resturantName
    }
    
    var resturantID: Int {
        return _resturantID
    }
    
    init(resturantName: String, resturantID: Int){
        self._resturantName = resturantName
        self._resturantID = resturantID
    }
}
