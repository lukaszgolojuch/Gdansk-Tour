//
//  Colors.swift
//  Gdansk Tour
//
//  Structure for colors that are used in this app
//  Four colors has been defined for different usage
//
//  Created by Łukasz Gołojuch on 5/26/22.


import SwiftUI

struct AppColors {
    
    //Dark blue color used for title text
    var darkBlue: Color {
        get {
            return Color(red: 5/255, green: 19/255, blue: 103/255)
        }
    }
    
    //Middle dark blue color used for all overlays
    var overlayColor: Color {
        get {
            return Color(red: 45/255, green: 49/255, blue: 250/255)
        }
    }
    
    //Darker light blue color used for all buttons background
    var buttonBackgroundColor: Color {
        get {
            return Color(red: 93/255, green: 139/255, blue: 244/255)
        }
    }
    
    //Light blue color used for app backgrounds
    var lightBlue: Color {
        get {
            return Color(red: 223/255, green: 246/255, blue: 255/255)
        }
    }
}
