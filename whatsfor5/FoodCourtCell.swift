//
//  Post2Cell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-20.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class FoodCourtCell: UITableViewCell {

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
