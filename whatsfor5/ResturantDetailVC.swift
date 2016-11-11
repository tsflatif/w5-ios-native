//
//  ResturantDetailVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-20.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class ResturantDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
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
        
        
        //item
        //cell.detailTextLable?.text = "$4.99"
        
    }

    

}
