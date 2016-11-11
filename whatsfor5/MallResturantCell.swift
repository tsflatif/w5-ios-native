//
//  MallResturantCell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-11-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit

class MallResturantCell: UITableViewCell {

    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ item:String) {//, image:UIImage) {
        resturantName.text = item
        //resturantImg.image = image
    }

}
