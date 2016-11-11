//
//  itemCell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-03.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class FoodItemCell: UITableViewCell {
    
    @IBOutlet weak var foodItem: UILabel!
    @IBOutlet weak var foodItemPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ item:String, price:String) {
        foodItem.text = item
        foodItemPrice.text = price
    }

}
