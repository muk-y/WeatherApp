//
//  UITableView+Extension.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import UIKit.UITableView

extension UITableView {
    
    func dequeue<T: UITableViewCell>(cellForRowAt indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
    }
    
}
