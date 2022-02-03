//
//  UISearchBar+Extension.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.

import UIKit.UISearchBar

extension UISearchBar {
    
    var textField: UITextField? {
        return self.value(forKey: "searchField") as? UITextField
    }
    
}
