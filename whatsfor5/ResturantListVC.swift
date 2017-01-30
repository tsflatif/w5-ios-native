//
//  FeedVC.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class ResturantListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.reloadData()
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tableview delegates
        tableView.delegate = self
        tableView.dataSource = self
        

        
        
        //Add logo to thecenter of the navigation bar
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        logoImageView.contentMode = .scaleAspectFit
        
        let logoImage = UIImage(named: "W5_logo")
        logoImageView.image = logoImage
        
        navigationItem.titleView = logoImageView
        
        //Connect the side menu
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 200
        }
            
        else {
            return 310
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "ResturantCell") as! ResturantCell
        }
        
        else {
            return tableView.dequeueReusableCell(withIdentifier: "FoodCourtCell") as! FoodCourtCell
        }
    }
    
    //tableviewMall
    



    

}
