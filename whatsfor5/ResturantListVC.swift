//
//  FeedVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation
import GeoFire

class ResturantListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var resturantCellList = [Resturant]()
    
    static var imageCache = NSCache<NSString, UIImage>()
    let locationManager = CLLocationManager()
    var geofire: GeoFire?
    var foundQuery: GFCircleQuery?
    
    var userLatitude = CLLocationDegrees()
    var userLongitude = CLLocationDegrees()
    var userLocation = CLLocation()
    
    var queryRadius = 0.50
    
    let threshold: CGFloat = 100.0 // threshold from bottom of tableView
    var isLoadingMore = false // flag
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        addObservers()
        isAuthorizedtoGetUserLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            //locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestLocation()
        }
        
        getQuery(radius: queryRadius)
        

        
        
        
//        geofire = GeoFire(firebaseRef: DBProvider.Instance.REF_GEO)
//        
//        //print("UserLocation:")
//        //print(userLocation)
//        //userLocation = locationManager.location!
//        
//        let mockLocation: CLLocation = CLLocation(latitude: 43.739090,
//                                                   longitude: -79.344163)
//        if foundQuery == nil {
//            self.resturantCellList = []
//            foundQuery = geofire?.query(at: mockLocation, withRadius: queryRadius)
//            
//            foundQuery!.observe(.keyEntered, with: { (key: String?, location: CLLocation?) in
//                //print("Key '\(key)' entered the search area and is at location '\(location)'")
//                
//                DBProvider.Instance.REF_RESTURANTS.child(key!).observe(.value, with: { snapshot in
//                    //self.resturantCellList = []
//
//                    if let postDict = snapshot.value as? Dictionary<String, AnyObject> {
//                        let resturant = Resturant(resturantKey: key!, dictionary: postDict)
//                        self.resturantCellList.append(resturant)
//                    }
//                    
//                    if self.resturantCellList.count < 3 {
//                        print("less than 3")
//                        self.queryRadius = self.queryRadius + 0.50
//                    }
//                    
//                    self.tableView.reloadData()
//                })
//            })
//            
//            
//        }

        
        
//        DBProvider.Instance.REF_RESTURANTS.observe(.value, with: { snapshot in
//            self.resturantCellList = []
//            
//            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
//                for snap in snapshots {
//                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
//                        let key = snap.key
//                        let resturant = Resturant(resturantKey: key, dictionary: postDict)
//                        self.resturantCellList.append(resturant)
//                    }
//                }
//            }
//            self.tableView.reloadData()
//        })
        
    }
    
    
    
    func getQuery(radius: Double) {
        if (radius > 5.0) {
            print("radius of 11")
        } else {
            print("not 11")
        }

        geofire = GeoFire(firebaseRef: DBProvider.Instance.REF_GEO)
        
        userLocation = locationManager.location!
        
//        let mockLocation: CLLocation = CLLocation(latitude: 43.739090,
//                                                  longitude: -79.344163)
        if foundQuery == nil {
            self.resturantCellList = []
            foundQuery = geofire?.query(at: userLocation, withRadius: radius)
            
            foundQuery!.observe(.keyEntered, with: { (key: String?, location: CLLocation?) in
                //print("Key '\(key)' entered the search area and is at location '\(location)'")
                
                DBProvider.Instance.REF_RESTURANTS.child(key!).observe(.value, with: { snapshot in
                    //self.resturantCellList = []

                    if let postDict = snapshot.value as? Dictionary<String, AnyObject> {
                        let resturant = Resturant(resturantKey: key!, dictionary: postDict)
                        self.resturantCellList.append(resturant)
                    }
                    //print(self.resturantCellList.count)
                    //self.tableView.reloadData()
                    self.resturantCellList.sort{ $0.walkMinutes < $1.walkMinutes }
                    let contentOffset = self.tableView.contentOffset
                    self.tableView.reloadData()
                    self.tableView.layoutIfNeeded()
                    self.tableView.setContentOffset(contentOffset, animated: false)
                    
                    
                })
            })
        }
        //print(self.resturantCellList.count)
        foundQuery = nil
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturantCellList.count
    }

    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row % 2 == 0 {
//            return 200
//        }
//            
//        else {
//            return 310
//        }
//    }
//    var isLoadingTableView = true
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if (resturantCellList.count > 0) && isLoadingTableView{
//            if let visibleRowIndexes = tableView.indexPathsForVisibleRows, let lastIndex = visibleRowIndexes.last, lastIndex.row == indexPath.row {
//                isLoadingTableView = false
//
//                if resturantCellList.count < 6 {
//                    self.queryRadius = queryRadius + 0.50
//                    getQuery(radius: self.queryRadius)
//                }
//            }
//        }
//
////        let contentOffset = tableView.contentOffset
////        tableView.reloadData()
////        tableView.layoutIfNeeded()
////        tableView.setContentOffset(contentOffset, animated: false)
//
//    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("begin draggin")
        if (resturantCellList.count <= 5){
            self.queryRadius = queryRadius + 0.50
            getQuery(radius: self.queryRadius)
        }
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("draggin")
//        if (resturantCellList.count < 5){
//            self.queryRadius = queryRadius + 0.50
//            getQuery(radius: self.queryRadius)
//        }
//    }
    
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print("end draggin")
//        if (resturantCellList.count < 3){
//            getQuery(radius: 11.0)
//        }
//        
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myresturant = resturantCellList[indexPath.row]
        
        if (myresturant.isFoodCourt)! {
            tableView.rowHeight = 200
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ResturantCell") as? ResturantCell {
                cell.request?.cancel()
                
                var img: UIImage?
                
                if let url = myresturant.imageUrl {
                    img = ResturantListVC.imageCache.object(forKey: url as NSString)
                }
                
                cell.configureCell(myresturant, img: img)
                return cell
            } else {
                return ResturantCell()
            }
        }
        else {
            tableView.rowHeight = 310
            return tableView.dequeueReusableCell(withIdentifier: "FoodCourtCell") as! FoodCourtCell
        }
    }
    
    //tableviewMall

}

extension ResturantListVC {
    fileprivate func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addObservers() {
        //Connect the side menu
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Add logo to thecenter of the navigation bar
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        logoImageView.contentMode = .scaleAspectFit
        
        let logoImage = UIImage(named: "W5_logo")
        logoImageView.image = logoImage
        
        navigationItem.titleView = logoImageView
    }
}

extension ResturantListVC {
    //if we have no permission to access user location, then ask user for permission.
    func isAuthorizedtoGetUserLocation() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //this method will be called each time when a user change his location access preference.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("User allowed us to access location")
            //do whatever init activities here.
        }
    }
    
    //this method is called by the framework on locationManager.requestLocation();
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        //userLatitude = locValue.latitude
        //userLongitude = locValue.longitude
        userLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Did location updates is called but failed getting location \(error)")
    }
}
