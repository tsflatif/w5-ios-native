//
//  Helper.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-01-21.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//

extension UITextField {
    
    func underlined(confirm: Bool){
        let border = CALayer()
        let width = CGFloat(1.5)
        
        if(confirm){
            border.borderColor = POSITIVE_COLOR.cgColor
        }
        else {
            border.borderColor = GRAY_BKGND_COLOR.cgColor
        }
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}

