//
//  UINavigationBar+Extension.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    static func setAppearance(){
           
           UINavigationBar.appearance().barTintColor = UIColor.black
           UINavigationBar.appearance().tintColor = UIColor.white
           UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
       }
}
