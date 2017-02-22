//
//  AddNewResturant3VC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-01-28.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddNewResturant3VC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodItemCell2") as? FoodItemCell {
            
            cell.configureCell("Chickkon Bhorta", price: "$3.99")
            
            return cell
        } else {
            return FoodItemCell()
        }
        
    }

}
