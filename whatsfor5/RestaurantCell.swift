//
//  PostCell.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-10-04.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import UIKit
import Alamofire

class RestaurantCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImg: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantDistance: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantOpenTime: UILabel!
    
    var restaurant: Restaurant!
    var request: Request?
    
    func configureCell(_ restaurant: Restaurant, img: UIImage?) {
        self.restaurant = restaurant
        
        restaurantName.text = self.restaurant.restaurantName.capitalized
        restaurantAddress.text = self.restaurant.restaurantAdress.capitalized
        restaurantOpenTime.text = self.restaurant.restaurantTime.capitalized
        restaurantDistance.text = self.restaurant.walkTime.capitalized
        //restaurantImg.image = UIImage(named: "beef-burrito.jpg")
        
        if restaurant.imageUrl != nil {
            if img != nil {
                self.restaurantImg.image = img
            } else {
                request = Alamofire.request(restaurant.imageUrl!)
                    .validate(contentType: ["image/*"])
                    .response { response in
                        
                        if response.error == nil {
                            let img = UIImage(data: response.data!)!
                            self.restaurantImg.image = img
                            RestaurantListVC.imageCache.setObject(img, forKey: self.restaurant.imageUrl! as NSString)
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
