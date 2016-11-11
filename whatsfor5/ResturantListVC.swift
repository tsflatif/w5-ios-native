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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tableview delegates
        tableView.delegate = self
        tableView.dataSource = self

        
        
        //Add logo to thecenter of the navigation bar
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        logoImageView.contentMode = .ScaleAspectFit
        
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 150
        }
            
        else {
            return 200
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        }
        
        else {
            return tableView.dequeueReusableCellWithIdentifier("FoodCourtCell") as! FoodCourtCell
        }
    }
    
    //tableviewMall
    



    

}
