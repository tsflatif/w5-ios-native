//
//  PostCell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class ResturantCell: UITableViewCell {
    
    @IBOutlet weak var resturantImg: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantDistance: UILabel!
    @IBOutlet weak var resturantAddress: UILabel!
    @IBOutlet weak var resturantTime: UILabel!
    
    var resturant: Resturant!
    
    func configureCell(_ resturant: Resturant) {
        self.resturant = resturant
        
        resturantName.text = self.resturant.resturantName.capitalized
        resturantImg.image = UIImage(named: "beef-burrito.jpg")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = GRAY_BKGND_COLOR.cgColor
        
        layer.cornerRadius = 2.0
        layer.shadowColor = SHADOW_COLOR.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
