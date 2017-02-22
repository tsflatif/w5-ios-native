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

class AddNewResturantVC: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var resturantImageView: UIImageView!
    
    @IBOutlet weak var resturantNameText: HoshiTextField!
    @IBOutlet weak var categoryText: HoshiTextField!
    @IBOutlet weak var cityText: HoshiTextField!
    
    var itemArray: [Any]?
    var imagePicker = UIImagePickerController()
    var resturantName: String?
    var city: String?
    var postalCode: String?
    var streetAddress: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        
        itemArray = [self.resturantNameText, self.categoryText, self.cityText, self.resturantImageView, self.imagePicker]
        for delegateItems in itemArray! {
            setDelegates(item: delegateItems)
        }
        
        if (resturantName == nil) {
            showMapOption()
        } else {
            resturantNameText.text = resturantName
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
            let arrayDataSource = catergoryList
            pickerView.setDataSource(arrayDataSource)
            
            pickerView.showDialog("Category", doneButtonTitle: "Done", cancelButtonTitle: "Cancel") { (result) -> Void in
                self.categoryText.text = "\(result)"
            }
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNewResturant2VC") as! AddNewResturant2VC
        vc.streetAddress = self.streetAddress
        vc.postalCode = self.postalCode
        vc.resturantImage = self.resturantImageView.image
        self.navigationController?.pushViewController(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddNewResturantVC {
    func setDelegates(item: Any) {
        if let textField = item as? HoshiTextField {
            textField.delegate = self
            textField.autocorrectionType = .no
            
            if textField == categoryText {
                let tap1 = UITapGestureRecognizer(target: self, action: #selector(AddNewResturantVC.categoryTextTapped))
                
                let dummyView = UIView(frame: self.categoryText.frame)
                self.view.addSubview(dummyView)
                dummyView.addGestureRecognizer(tap1)
            }
            
            if textField == cityText {
                let tap = UITapGestureRecognizer(target: self, action: #selector(AddNewResturantVC.cityTextTapped))
                let dummyView = UIView(frame: self.cityText.frame)
                self.view.addSubview(dummyView)
                dummyView.addGestureRecognizer(tap)
            }
        }
        if let imageView = item as? UIImageView {
            if imageView == resturantImageView {
                let tap = UITapGestureRecognizer(target: self, action: #selector(AddNewResturantVC.resturantImageViewTapped))
                let dummyView = UIView(frame: self.resturantImageView.frame)
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
        
        let manualAction = UIAlertAction(title: "Enter Manually", style: .default) { action in }
        
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

extension AddNewResturantVC : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            resturantImageView.contentMode = .scaleAspectFill
            resturantImageView.image = editedImage
        } else if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            resturantImageView.contentMode = .scaleAspectFill
            resturantImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func resturantImageViewTapped() {
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
