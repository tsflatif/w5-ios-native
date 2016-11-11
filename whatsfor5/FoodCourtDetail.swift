//
//  ViewController.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-09-16.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class FoodCourtDetail: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("FoodItemCell") as? FoodItemCell {
            
            cell.configureCell("Chickkon Burrito", price: "$3.99")
            
            return cell
        } else {
            return FoodItemCell()
        }
    }


}

