//
//  PostCell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit
import Alamofire

class ResturantCell: UITableViewCell {
    
    @IBOutlet weak var resturantImg: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantDistance: UILabel!
    @IBOutlet weak var resturantAddress: UILabel!
    @IBOutlet weak var resturantOpenTime: UILabel!
    
    var resturant: Resturant!
    var request: Request?
    
    func configureCell(_ resturant: Resturant, img: UIImage?) {
        self.resturant = resturant
        
        resturantName.text = self.resturant.resturantName.capitalized
        resturantAddress.text = self.resturant.resturantAdress.capitalized
        resturantOpenTime.text = self.resturant.resturantTime.capitalized
        resturantDistance.text = self.resturant.walkTime.capitalized
        //resturantImg.image = UIImage(named: "beef-burrito.jpg")
        
        if resturant.imageUrl != nil {
            if img != nil {
                self.resturantImg.image = img
            } else {
                request = Alamofire.request(resturant.imageUrl!)
                    .validate(contentType: ["image/*"])
                    .response { response in
                        
                        if response.error == nil {
                            let img = UIImage(data: response.data!)!
                            self.resturantImg.image = img
                            ResturantListVC.imageCache.setObject(img, forKey: self.resturant.imageUrl! as NSString)
                        }
                }
            }
        };
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
