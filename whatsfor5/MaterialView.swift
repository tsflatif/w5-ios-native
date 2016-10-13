//
//  MaterialView.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-09-26.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = SHADOW_COLOR.CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}
