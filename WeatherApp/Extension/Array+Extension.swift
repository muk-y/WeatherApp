//
//  Array+Extension.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import Foundation

extension Array {
    
    func elementAt(index: Int) -> Array.Iterator.Element? {
        if index < self.count && index >= .zero {
            return self[index]
        }
        return nil
    }
    
}
