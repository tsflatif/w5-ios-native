//
//  AddANewResturantVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-19.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddNewResturantVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var resturantNameText: HoshiTextField!
    @IBOutlet weak var categoryText: HoshiTextField!
    @IBOutlet weak var cityText: HoshiTextField!
    
    //var activeTextField: HoshiTextField?
    var addressArray: [HoshiTextField]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObservers()
        
        addressArray = [self.resturantNameText, self.categoryText, self.cityText]
        
        for addressText in addressArray! {
            initCustomTextField(textFieldItem: addressText)
        }
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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
        
//        let frameYPos = UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height)!
//        if self.view.frame.origin.y != frameYPos{
//            self.view.frame.origin.y = frameYPos
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    
    @IBAction func categoryTextChanged(_ sender: UITextField) {

    }
    
    @IBAction func cityTextChanged(_ sender: UITextField) {
        
    }

    // MARK: - non built-in functions
    
    func categoryTextTapped() {
        let pickerView = CustomPickerDialog.init()
        let arrayDataSource = catergoryList
        pickerView.setDataSource(arrayDataSource)
        
        pickerView.showDialog("Category", doneButtonTitle: "done", cancelButtonTitle: "cancel") { (result) -> Void in
            self.categoryText.text = "\(result)"
        }
    }
    
    func cityTextTapped() {
        let pickerView = CustomPickerDialog.init()
        let arrayDataSource = cityList
        pickerView.setDataSource(arrayDataSource)
        
        pickerView.showDialog("City", doneButtonTitle: "done", cancelButtonTitle: "cancel") { (result) -> Void in
            self.cityText.text = "\(result)"
        }
    }
    
    func initCustomTextField(textFieldItem: HoshiTextField) {
        textFieldItem.delegate = self
        textFieldItem.autocorrectionType = .no
        
        if textFieldItem == categoryText {
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(AddNewResturantVC.categoryTextTapped))
            
            let dummyView = UIView(frame: self.categoryText.frame)
            self.view.addSubview(dummyView)
            dummyView.addGestureRecognizer(tap1)
        }
        
        if textFieldItem == cityText {
            let tap = UITapGestureRecognizer(target: self, action: #selector(AddNewResturantVC.cityTextTapped))
            let dummyView = UIView(frame: self.cityText.frame)
            self.view.addSubview(dummyView)
            dummyView.addGestureRecognizer(tap)
        }
        
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
