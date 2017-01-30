//
//  AddNewResturant2VC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-01-22.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddNewResturant2VC: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate, UITextViewDelegate {
    
    //@IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var postalCodeText: HoshiTextField!
    @IBOutlet weak var streetAddressText: HoshiTextField!
    @IBOutlet weak var emailText: HoshiTextField!
    @IBOutlet weak var websiteText: HoshiTextField!
    @IBOutlet weak var phoneText: HoshiTextField!
    
    var activeTextField: UITextField?
    var addressArray: [UITextField]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObservers()
        
        addressArray = [self.postalCodeText, self.streetAddressText, self.emailText, self.websiteText, self.phoneText]
        
        for addressText in addressArray! {
            initCustomTextField(textFieldItem: addressText)
        }

//        if revealViewController() != nil {
//            menuButton.target = revealViewController()
//            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
//            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
//            //view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeObservers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
//        for addressText in addressArray! {
//            if (addressText.text!.isEmpty) {
//                addressText.underlined(confirm: false)
//            }
//        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            let frameYPos = UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height)!
//            let fieldYPos = (activeTextField?.frame.origin.y)! - (activeTextField?.frame.height)!
//            
//            if self.view.frame.origin.y == frameYPos{
//                self.view.frame.origin.y = self.view.frame.origin.y - fieldYPos + keyboardSize.height
//                
//                if self.view.frame.origin.y > frameYPos {
//                    self.view.frame.origin.y = frameYPos
//                }
//            }
//        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
//            let frameYPos = UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height)!
//            if self.view.frame.origin.y != frameYPos{
//                self.view.frame.origin.y = frameYPos
//            }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        for addressText in addressArray! {
            addressText.resignFirstResponder()
            if !(addressText.text!.isEmpty) {
                addressText.underlined(confirm: true)
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
    
    @IBAction func streetAddressTextChanged(_ sender: UITextField) {
//        streetAddressLabel.isHidden = false
//        
//        if (sender.text?.isEmpty)! {
//            streetAddressLabel.isHidden = true
//        }
    }
    
    @IBAction func postalCodeTextChanged(_ sender: UITextField) {
//        postalCodeLabel.isHidden = false
//        
//        if (sender.text?.isEmpty)! {
//            postalCodeLabel.isHidden = true
//        }
    }
    
    @IBAction func emailTextChanged(_ sender: UITextField) {
//        emailLabel.isHidden = false
//        
//        if (sender.text?.isEmpty)! {
//            emailLabel.isHidden = true
//        }
    }
    
    @IBAction func websiteTextChanged(_ sender: UITextField) {
//        websiteLabel.isHidden = false
//        
//        if (sender.text?.isEmpty)! {
//            websiteLabel.isHidden = true
//        }
    }
    
    @IBAction func phoneTextChanged(_ sender: UITextField) {
//        phoneLabel.isHidden = false
//        
//        if sender.text == "" {
//            phoneLabel.isHidden = true
//        }
    }
    
    //MARK: - non built-in functions
    
    func initCustomTextField(textFieldItem: UITextField) {
        textFieldItem.delegate = self
        textFieldItem.underlined(confirm: false)
        textFieldItem.autocorrectionType = .no
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    func setDelegates(_ fields: AnyObject...) {
        for item in fields {
            if let textField = item as? UITextField {
                textField.delegate = self
            }
            if let textView = item as? UITextView {
                textView.delegate = self
            }
        }
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
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
