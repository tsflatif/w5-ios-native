//
//  MallResturantCell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class FoodCourtRestaurantCell: UITableViewCell {

    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ name:String) {//, image:UIImage) {
        resturantName.text = name
        //resturantImg.image = image
    }

}
