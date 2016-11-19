//
//  ChangeItemPriceVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-17.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class ChangeItemPriceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func backTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

}
