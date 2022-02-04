//
//  UIActivityIndicatorView+Extension.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 04/02/2022.
//

import UIKit.UIActivityIndicatorView

extension UIActivityIndicatorView {
    
    static func customIndicator(at center: CGPoint) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        indicator.layer.cornerRadius = .zero
        indicator.color = .white
        indicator.style = .large
        indicator.center = center
        indicator.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        indicator.hidesWhenStopped = true
        return indicator
    }
    
}
