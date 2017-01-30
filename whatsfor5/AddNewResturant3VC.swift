//
//  AddNewResturant3VC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-01-28.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddNewResturant3VC: UIViewController, UITextFieldDelegate {

    //@IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var menuItem: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItem.delegate = self
        
//        if revealViewController() != nil {
//            menuButton.target = revealViewController()
//            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
//            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
//            //view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
