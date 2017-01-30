//
//  ChangeItemPriceVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-17.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit
import DropDown

class ChangeItemPriceVC: UIViewController {

    
    @IBOutlet weak var viewPickItem: UIButton!
    let dropDown = DropDown()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.dataSource = ["Cars","Mouse","Albatrous","Very Big belly buster shwarma you animal","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous","Mouse","Albatrous"]

        dropDown.anchorView = viewPickItem
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func backTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func changeTapped(_ sender: Any) {
        dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
            self.viewPickItem.setTitle("\(item)", for: UIControlState.normal)
            
            self.viewPickItem.tintColor = POSITIVE_COLOR
            
        }
    }
    
}
