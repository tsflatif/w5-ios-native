//
//  Helper.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2017-01-21.
//  Copyright © 2017 Tauseef Latif. All rights reserved.
//
import UIKit

extension UITextField {
    // Add a line at the bottom of a textfield
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

extension UIViewController {
    // Quick Alert Message
    func customAlertMsg(title: String, message: String){
        let alertVC = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
}

extension String {
    
    // To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    // Validate Email
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    // Validate URL
    var isWebURL: Bool {
        // TODO: Try better/safer logic. now it works if there is "<something>.<something>" anywhere in the text
        do {
            let regex = try NSRegularExpression(pattern: "((https://|http://|^))((\\w|-)+)(([.]|[/])((\\w|-)+))+", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    // Is string Alphanumeric
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    // Validate Password
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil){
                
                if(self.characters.count>=6 && self.characters.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
    
    // Validate Canadian Postal code
    var isCanadianPostalCode: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z][0-9][A-Z]\\s?[0-9][A-Z][0-9]", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    //Remove all white spaces
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

// Format phone number
extension String.Index{
    func advance(_ offset:Int, `for` string:String)->String.Index{
        return string.index(self, offsetBy: offset)
    }
}

func formatPhoneNumber(phone: String) -> String?  {
    
    let notPhoneNumbers = CharacterSet.decimalDigits.inverted
    let str = phone.components(separatedBy: notPhoneNumbers).joined(separator: "")

    let startIdx = str.startIndex
    let endIdx = str.endIndex
    
    let count = str.characters.count
    
    if count == 3 {
        return "\(str[startIdx..<startIdx.advance(3, for: str)])"
    }
    else if count == 4 {
        return "\(str[startIdx..<startIdx.advance(3, for: str)])-\(str[startIdx.advance(3, for: str)..<endIdx])"
    }
    else if count == 6 {
        return "\(str[startIdx..<startIdx.advance(3, for: str)])-\(str[startIdx.advance(3, for: str)..<startIdx.advance(6, for: str)])"
    }
    else if count == 7 {
        return "\(str[startIdx..<startIdx.advance(3, for: str)])-\(str[startIdx.advance(3, for: str)..<startIdx.advance(6, for: str)])-\(str[startIdx.advance(6, for: str)..<endIdx])"
    }
//    else if count == 10{
//        return "\(str[startIdx..<startIdx.advance(3, for: str)])-\(str[startIdx.advance(3, for: str)..<startIdx.advance(6, for: str)])-\(str[startIdx.advance(6, for: str)..<endIdx])"
//    }
//    else if count > 10{
//        let extra = str.characters.count - 10
//        return "+\(str[startIdx..<startIdx.advance(extra, for: str)]) (\(str[endIdx.advance(-10, for: str)..<endIdx.advance(-7, for: str)])) \(str[endIdx.advance(-7, for: str)..<endIdx.advance(-4, for: str)])-\(str[endIdx.advance(-4, for: str)..<endIdx])"
//    }
    return nil
}



