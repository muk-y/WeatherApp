//
//  CustomFont.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import UIKit.UIFont

enum CustomFont: String {
    
    case regular = "Helvetica"
    case bold = "Helvetica-Bold"
    
    func of(_ heading: Heading) -> UIFont {
        return UIFont(name: rawValue, size: heading.size)!
    }
    
}

enum Heading {
    
    case heading1
    case heading2
    case heading3
    case heading4
    case customHeading(size: CGFloat)
    
    var size: CGFloat {
        switch self {
        case .heading1:
            return 16
        case .heading2:
            return 14
        case .heading3:
            return 12
        case .heading4:
            return 10
        case .customHeading(let size):
            return size
        }
    }
    
}
