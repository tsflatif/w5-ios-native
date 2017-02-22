//
//  Constants.swift
//  whatsfor5
//
//  Created by Tauseef Latif on 2016-09-24.
//  Copyright © 2016 Tauseef Latif. All rights reserved.
//

import Foundation
import UIKit

// Deep Orange Color Palette
let STATUS_BAR_COLOR = UIColor(red:230/255, green:74/255, blue:25/255, alpha:1)             //E64A19 - 700
let PRIMARY_BAR_COLOR = UIColor(red:255/255, green:87/255, blue:34/255, alpha:1)            //FF5722 - 500
let SECONDARY_BAR_COLOR = UIColor(red:255/255, green:138/255, blue:101/255, alpha:1)        //FF8A65 - 300
let ACCENT_COLOR = UIColor(red:255/255, green:204/255, blue:188/255, alpha:1)               //FFCCBC - 100
let BACKGROUND_COLOR = UIColor(red:251/255, green:233/255, blue:231/255, alpha:1)           //FBE9E7 - 50
let SHADOW_COLOR = UIColor(red:157/255, green:157/255, blue:157/255, alpha:0.5)             //9D9D9D
let NAVIGATION_BAR_COLOR = UIColor(red:244/255, green:81/255, blue:30/255, alpha:1)         //F4511E


//Font colors
let  POSITIVE_COLOR = UIColor(red:76/255, green:175/255, blue:80/255, alpha:1)              //4CAF50
let  NEGATIVE_COLOR = UIColor(red:244/255, green:67/255, blue:54/255, alpha:1)              //F44336
let  WARNING_COLOR = UIColor(red:255/255, green:193/255, blue:7/255, alpha:1)               //FFC107
let  GRAY_BKGND_COLOR = UIColor(red:243/255, green:243/255, blue:243/255, alpha:1)          //F3F3F3


//Blue-Grey Color Pallets
//let  PRIMARY_BAR_COLOR = UIColor(red:96/255, green:125/255, blue:139/255, alpha:1)          //607D8B - 500
//let  STATUS_BAR_COLOR = UIColor(red:69/255, green:90/255, blue:100/255, alpha:1)            //455A64 - 700
//let  SECONDARY_BAR_COLOR = UIColor(red:144/255, green:164/255, blue:174/255, alpha:1)       //90A4AE - 300
//let  ACCENT_COLOR = UIColor(red:207/255, green:216/255, blue:220/255, alpha:1)              //CFD8DC - 100
//let  BACKGROUND_COLOR = UIColor(red:236/255, green:239/255, blue:241/255, alpha:1)          //ECEFF1 - 50
//let  SHADOW_COLOR = UIColor(red:157/255, green:157/255, blue:157/255, alpha:0.5)            //9D9D9D

// List of resturant categories
let catergoryList: [String] = ["Afghan", "African", "American (Traditional)", "Arabian", "Argentine", "Asian Fusion", "Australian", "Austrian", "Bangladeshi", "Barbeque", "Basque", "Belgian", "Bistros", "Brasseries", "Brazilian", "Breakfast & Brunch", "British", "Buffets", "Burgers", "Burmese", "Cafes", "Cajun/Creole", "Cambodian", "Canadian (New)", "Caribbean", "Cheesesteaks", "Chicken Shop", "Chicken Wings", "Chinese", "Colombian", "Comfort Food", "Creperies", "Cuban", "Czech", "Delis", "Dim Sum", "Diners", "Dinner Theater", "Egyptian", "Ethiopian", "Falafel", "Fast Food", "Filipino", "Fish & Chips", "Fondue", "Food Court", "Food Stands", "French", "Gastropubs", "German", "Gluten-Free", "Greek", "Guamanian", "Haitian", "Hakka", "Halal", "Hawaiian", "Himalayan/Nepalese", "Honduran", "Hot Dogs", "Hot Pot", "Hungarian", "Iberian", "Indian", "Indonesian", "International", "Irish", "Italian", "Japanese", "Kebab", "Korean", "Kosher", "Laotian", "Latin American", "Lebanese", "Live/Raw Food", "Malaysian", "Mauritius", "Mediterranean", "Mexican", "Middle Eastern", "Modern European", "Mongolian", "Moroccan", "Nicaraguan", "Noodles", "Pakistani", "Pan Asian", "Persian/Iranian", "Peruvian", "Pizza", "Polish", "Portuguese", "Poutineries", "Ramen", "Reunion", "Russian", "Salad", "Salvadoran", "Sandwiches", "Scandinavian", "Scottish", "Seafood", "Senegalese", "Singaporean", "Slovakian", "Soul Food", "Soup", "South African", "Southern", "Spanish", "Sri Lankan", "Steakhouses", "Supper Clubs", "Sushi Bars", "Syrian", "Taiwanese", "Tapas Bars", "Tapas/Small Plates", "Tex-Mex", "Thai", "Turkish", "Ukrainian", "Vegan", "Vegetarian", "Venezuelan", "Vietnamese", "Waffles"]

// List of supported cities
let cityList: [String] = ["Toronto"]

// Global variable for side menu
var sideMenuOpen: Bool?

