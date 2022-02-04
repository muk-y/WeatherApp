//
//  DataManager.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 04/02/2022.
//

import Foundation

class DataManager {
    
    static var favouriteCitiesID: [Int] {
        return UserDefaults.standard.array(forKey: GlobalConstants.UserDefaultsKey.favouriteCitiesID) as? [Int] ?? []
    }
    
}
