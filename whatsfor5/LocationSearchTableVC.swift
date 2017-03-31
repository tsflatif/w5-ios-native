//
//  LocationSearchTableVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-02-10.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//

import UIKit
import MapKit

class LocationSearchTableVC: UITableViewController {
    
    var handleMapSearchDelegate:HandleMapSearch? = nil
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? "",
            secondSpace,
            //postalcode
            selectedItem.postalCode ?? ""
        )
        
        return addressLine
    }
}

extension LocationSearchTableVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            for item in self.matchingItems {
                if (item.placemark.country != "Canada") {
                    self.matchingItems.remove(at: self.matchingItems.index(of: item)!)
                }
            }
            self.tableView.reloadData()
        }
    }
}

extension LocationSearchTableVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = parseAddress(selectedItem: selectedItem)
        return cell
    }
}

extension LocationSearchTableVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.sendAddressBackAgain(placemark: selectedItem)
        dismiss(animated: true, completion: nil)
        //dropPinZoomIn sendAddressBackAgain
    }
}

//CLGeocoder().reverseGeocodeLocation(location.location, completionHandler: {(placemarks, error) -> Void in
//    
//    if error != nil {
//        println("Reverse geocoder failed with error" + error.localizedDescription)
//        return
//    }
//    
//    if placemarks.count > 0 {
//        let pm = placemarks[0] as CLPlacemark
//        
//        //Printing to console to check value!
//        println("\(pm.locality)")
//        println("\(pm.subLocality)")
//        
//        self.locality = pm.locality as String
//        if ( pm.subLocality != nil) {
//            
//            self.subLocality = pm.subLocality as String
//        }
//    }
//    else {
//        println("Problem with the data received from geocoder")
//    }
//})
