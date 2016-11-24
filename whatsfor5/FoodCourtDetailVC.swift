//
//  ViewController.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-09-16.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class FoodCourtDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCourtResturantCell") as? FoodCourtResturantCell {
            
            cell.configureCell("Gaseous Fartous")
            
            return cell
        } else {
            return FoodCourtResturantCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func backTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

