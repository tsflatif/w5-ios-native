//
//  AddNewResturant2VC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-01-22.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddNewRestaurant2VC: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var postalCodeText: HoshiTextField!
    @IBOutlet weak var streetAddressText: HoshiTextField!
    @IBOutlet weak var emailText: HoshiTextField!
    @IBOutlet weak var websiteText: HoshiTextField!
    @IBOutlet weak var phoneText: HoshiTextField!
    
    var itemArray: [Any]?
    var postalCode: String?
    var streetAddress: String?
    var restaurantImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        itemArray = [self.postalCodeText, self.streetAddressText, self.emailText, self.websiteText, self.phoneText]
        
        for delegateItems in itemArray! {
            setDelegates(item: delegateItems)
        }
        
        postalCodeText.text = postalCode
        streetAddressText.text = streetAddress
        restaurantImageView.image = restaurantImage
        restaurantImageView.contentMode = .scaleAspectFill
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
    
    //MARK: - items tapped 
    
    @IBAction func streetAddressTextChanged(_ sender: HoshiTextField) {
    }
    
    @IBAction func postalCodeTextChanged(_ sender: HoshiTextField) {
        
        if !((sender.text?.isCanadianPostalCode))! {
            sender.borderInactiveColor = NEGATIVE_COLOR
        } else {
            sender.borderInactiveColor = POSITIVE_COLOR
        }
        
        let trimmedString = sender.text?.removingWhitespaces()
        if (trimmedString?.characters.count)! > 6 {
            sender.deleteBackward()
        }
    }
    
    @IBAction func emailTextChanged(_ sender: HoshiTextField) {
    }
    
    @IBAction func emailTextEndEdit(_ sender: HoshiTextField) {
        if !((sender.text?.isEmail))! {
            sender.borderInactiveColor = NEGATIVE_COLOR
        } else {
            //sender.borderInactiveColor = POSITIVE_COLOR
        }
    }
    
    @IBAction func websiteTextChanged(_ sender: HoshiTextField) {
    }
    
    @IBAction func websiteTextEndEdit(_ sender: HoshiTextField) {
        if !((sender.text?.isWebURL))! {
            sender.borderInactiveColor = NEGATIVE_COLOR
        } else {
            //sender.borderInactiveColor = POSITIVE_COLOR
        }
    }
    @IBAction func phoneTextChanged(_ sender: HoshiTextField) {
        
        if (sender.text?.characters.count)! > 12 {
            sender.deleteBackward()
        }
        else {
            let phoneNumber = formatPhoneNumber(phone: sender.text!)
            if (phoneNumber != nil) {
                phoneText.text = phoneNumber
            }
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    
}

extension AddNewRestaurant2VC {
    func setDelegates(_ item: Any) {
        if let textField = item as? HoshiTextField {
            textField.delegate = self
            textField.autocorrectionType = .no
        }
    }
}


