//
//  ThankYouVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-18.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class ThankYouVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToHomeTapped(_ sender: Any) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }

    

}
