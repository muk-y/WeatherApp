//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import UIKit.UIView

extension UIView {
    
    var curve: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
    
    func capsuled() {
        curve = frame.height / 2
    }
    
}
