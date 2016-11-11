//
//  PostCell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var resturantImg: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantDistance: UILabel!
    @IBOutlet weak var resturantAddress: UILabel!
    @IBOutlet weak var resturantTime: UILabel!
    
    var resturant: Resturant!
    
    func configureCell(resturant: Resturant) {
        self.resturant = resturant
        
        resturantName.text = self.resturant.resturantName.capitalizedString
        resturantImg.image = UIImage(named: "beef-burrito.jpg")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = GRAY_BKGND_COLOR.CGColor
        
        layer.cornerRadius = 2.0
        layer.shadowColor = SHADOW_COLOR.CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
