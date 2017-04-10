//
//  AddANewResturantVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-19.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit
import TextFieldEffects
import PopupDialog
import MapKit
import Firebase
import FirebaseDatabase
import GeoFire

class AddNewRestaurantVC: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var restaurantNameText: HoshiTextField!
    @IBOutlet weak var categoryText: HoshiTextField!
    @IBOutlet weak var cityText: HoshiTextField!
    
    var itemArray: [Any]?
    var imagePicker = UIImagePickerController()
    var restaurantName: String?
    var category: String?
    var city: String?
    var postalCode: String?
    var streetAddress: String?
    
    var restu = [Restaurant]()
    var geofire: GeoFire?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        
        itemArray = [self.restaurantNameText, self.categoryText, self.cityText, self.restaurantImageView, self.imagePicker]
        for delegateItems in itemArray! {
            setDelegates(item: delegateItems)
        }
        //showMapOption()
        if (restaurantName == nil) {
            showMapOption()
        } else {
            restaurantNameText.text = restaurantName
            categoryText.text = category
            cityText.text = cityList.contains(city!) ? city : nil
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (sideMenuOpen == true) {
            self.revealViewController().rightRevealToggle(animated: true)
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // MARK: - items tapped
    
    func categoryTextTapped() {
        if (sideMenuOpen == true) {
            self.revealViewController().rightRevealToggle(animated: true)
        }
        else {
            let pickerView = CustomPickerDialog.init()
            let arrayDataSource = categoryList
            pickerView.setDataSource(arrayDataSource)
            
            pickerView.showDialog("Category", doneButtonTitle: "Done", cancelButtonTitle: "Cancel") { (result) -> Void in
                self.categoryText.text = "\(result)"
            }
//            let searchTable = self.storyboard!.instantiateViewController(withIdentifier: "searchTable") as! searchTableVC
//            searchTable.data = categoryList
//            self.navigationController?.navigationBar.tintColor = UIColor.white
//            self.navigationController?.show(searchTable, sender: nil)
            
        }
    }
    
    func cityTextTapped() {
        if (sideMenuOpen == true) {
            self.revealViewController().rightRevealToggle(animated: true)
        }
        else {
            let pickerView = CustomPickerDialog.init()
            let arrayDataSource = cityList
            pickerView.setDataSource(arrayDataSource)
        
            pickerView.showDialog("City", doneButtonTitle: "Done", cancelButtonTitle: "Cancel") { (result) -> Void in
                self.cityText.text = "\(result)"
            }
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        print("pressed")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNewRestaurant2VC") as! AddNewRestaurant2VC
//        vc.streetAddress = self.streetAddress
//        vc.postalCode = self.postalCode
//        vc.resturantImage = self.restaurantImageView.image
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        AuthProvider.Instance.signUp(withEmail: "mewo@cat.com", password: "123456", loginHandler: { (message) in
//            
//            if message != nil {
//            } else {
//                
//            }
//            
//        });
        
//
        let latitude: CLLocationDegrees = 43.7055819
        let longitude: CLLocationDegrees = -79.34711
        
        let restulocation: CLLocation = CLLocation(latitude: latitude,
                                                   longitude: longitude)
        let data: Dictionary<String, Any> = [RESTAURANT_ID: "Silly Kitty",
                                            RESTAURANT_NAME: "Pizza Pizza",// resturantNameText.text ?? "",
                                             "restaurant_type": "Seafood",
                                             "business_type": "Franchisee",
                                             "phone": "6477897890",
                                             "website": "www.ultimatekitty.com",
                                             "email": "meow@cat.com",
                                             "address_1": "747 Don Mills Rd",
                                             "city_town": "Toronto",
                                             "state_province": "Ontario",
                                             "country": "Sparta",
                                             "restaurant_image" : "https://firebasestorage.googleapis.com/v0/b/whatsfor5test.appspot.com/o/pizza_pizza_logo43271.jpg?alt=media&token=8112d7dd-d218-4da7-9a34-4facbc876d31",
                                             "takes_cash": true,
                                             "takes_credit": true,
                                             "takes_debit": true,
                                             "is_take_out": false,
                                             "is_foodcourt": true,
                                             "date_updated": "yyyy-mm-dd hh:mm:ss",
                                             "restaurant_status": "active",
                                             "menu_item_number": 3,
                                             "l": ["latitude": 43.7055819, "longitude": -79.34711],
                                             "operating_hours": ["monday" :["open": 0800, "close": 2300],
                                                                 "tuesday" :["open": 0800, "close": 2300],
                                                                 "wednesday" :["open": 0800, "close": 2300],
                                                                 "thursday" :["open": 0800, "close": 2300],
                                                                 "friday" :["open": 0800, "close": 2300],
                                                                 "saturday" :["open": 0800, "close": 2300],
                                                                 "sunday" :["open": 0800, "close": 2300]]]
//                                             "menu_item": ["menu_item_name" : "Chilli Chicken",
//                                                           "menu_item_price": 8.99,
//                                                           "menu_item_description": "Spicy Shit"]]
        

        //DBProvider.Instance.REF_RESTAURANTS.childByAutoId().setValue(data)
//        let latitude: CLLocationDegrees = 43.7364404
//        let longitude: CLLocationDegrees = -79.3443833
//        
//        let restulocation: CLLocation = CLLocation(latitude: latitude,
//                                              longitude: longitude)
        let uniqRef = DBProvider.Instance.REF_RESTAURANTS.childByAutoId()
        uniqRef.setValue(data)
        geofire = GeoFire(firebaseRef: DBProvider.Instance.REF_GEO)
        geofire?.setLocation(restulocation, forKey: uniqRef.key)
        
//        let menuItemData: Dictionary<String, Any> = ["menu_item_name": restaurantNameText.text ?? "",
//                                                 "menu_item_price": 8.99,
//                                                 "menu_item_description": restaurantNameText.text ?? ""]
//        
//        DBProvider.Instance.REF_RESTAURANTS.child("-Kezn5P1UatwlxPXiYF5/menu_item").childByAutoId().updateChildValues(menuItemData)
//        
//        
//        let itemData: Dictionary<String, Any> = ["menu_item_name": "Kacchi",
//                                                 "menu_item_price": 8.99,
//                                                 "menu_item_description": "Spicy shit"]
        
        //DBProvider.Instance.REF_MENU.child("/menu_item/\(self.user.uid)").childByAutoId().setValue(itemData)
        //-KeameSODRQMOVMik3Za
        
        //DBProvider.Instance.REF_MENU.child("-KeameSODRQMOVMik3Za").setValue(itemData)
        
//        let faqQuery = DBProvider.Instance.REF_MENU.queryOrdered(byChild: "menu_id").queryEqual(toValue: "1234567890")
//        
//        //faqQuery.setValue(itemData)
//        
//        
//        faqQuery.observe(.value, with: { snapshot in
//            
//            if let result = snapshot.children.allObjects as? [FIRDataSnapshot] {
//                for child in result {
//                    var userKey = child.key as! String
//                    
//                    print(userKey)
//                    DBProvider.Instance.REF_MENU.child("\(userKey)/menu_item").childByAutoId().setValue(itemData)
//                    break
//                    //if(userKey == userKeyYouWantToUpdateDeviceFor){
//                        //rootRef.child("users").child(userKey).child("device").setValue(device)
//                    //}
//                }
//            }
//        })
        

    }

}

// Private functions
extension AddNewRestaurantVC {
    fileprivate func setDelegates(item: Any) {
        if let textField = item as? HoshiTextField {
            textField.delegate = self
            textField.autocorrectionType = .no
            
            if textField == categoryText {
                let tap1 = UITapGestureRecognizer(target: self, action: #selector(AddNewRestaurantVC.categoryTextTapped))
                
                let dummyView = UIView(frame: self.categoryText.frame)
                self.view.addSubview(dummyView)
                dummyView.addGestureRecognizer(tap1)
            }
            
            if textField == cityText {
                let tap = UITapGestureRecognizer(target: self, action: #selector(AddNewRestaurantVC.cityTextTapped))
                let dummyView = UIView(frame: self.cityText.frame)
                self.view.addSubview(dummyView)
                dummyView.addGestureRecognizer(tap)
            }
        }
        if let imageView = item as? UIImageView {
            if imageView == restaurantImageView {
                let tap = UITapGestureRecognizer(target: self, action: #selector(AddNewRestaurantVC.restaurantImageViewTapped))
                let dummyView = UIView(frame: self.restaurantImageView.frame)
                self.view.addSubview(dummyView)
                dummyView.addGestureRecognizer(tap)
            }
        }
        if let imagePicker = item as? UIImagePickerController {
            imagePicker.delegate = self
        }
    }
    
    func showMapOption() {
        let useMapMsg = "Auto fill resurant address using maps?"
        
        let alertController = UIAlertController(title: nil, message: useMapMsg, preferredStyle: .alert)
        alertController.view.tintColor = SECONDARY_BAR_COLOR
        
        let manualAction = UIAlertAction(title: "Enter Manually", style: .default) { action in
//            let mapController = self.storyboard!.instantiateViewController(withIdentifier: "searchTable") as! searchTableVC
//            mapController.data = categoryList
//            self.navigationController?.navigationBar.tintColor = UIColor.white
//            self.navigationController?.show(mapController, sender: nil)
            
        }
        
        let mapAction = UIAlertAction(title: "Use Map", style: .default) { action in
            let mapController = self.storyboard!.instantiateViewController(withIdentifier: "MapSelect") as! MapSelectVC
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.show(mapController, sender: nil)
        }
        
        alertController.addAction(mapAction)
        alertController.addAction(manualAction)
        self.present(alertController, animated: true)
    }
    
    func addObservers() {
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}

extension AddNewRestaurantVC : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            restaurantImageView.contentMode = .scaleAspectFill
            restaurantImageView.image = editedImage
        } else if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            restaurantImageView.contentMode = .scaleAspectFill
            restaurantImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func restaurantImageViewTapped() {
        if (sideMenuOpen == true) {
            self.revealViewController().rightRevealToggle(animated: true)
        }
        else {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            alertController.view.tintColor = SECONDARY_BAR_COLOR
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            }
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    self.imagePicker.allowsEditing = true
                    self.imagePicker.sourceType = .camera
                    self.imagePicker.cameraCaptureMode = .photo
                    self.imagePicker.modalPresentationStyle = .fullScreen
                    self.present(self.imagePicker,animated: true,completion: nil)
                } else {
                    self.customAlertMsg(title: "No Camera", message: "Sorry, this device has no camera")
                }
            }
            
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.navigationBar.barTintColor = NAVIGATION_BAR_COLOR
                self.imagePicker.navigationBar.isTranslucent = false
                self.imagePicker.navigationBar.tintColor = UIColor.white
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cancelAction)
            alertController.addAction(cameraAction)
            alertController.addAction(photoLibraryAction)
            self.present(alertController, animated: true)
        }
    }
}
