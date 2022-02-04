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
    
    //this is the array of id for Kathmandu, Pokhara & Ilam as these are the required weather locations for our app
    static var requiredLocationsID: [Int] {
        return [1283240, 1283334, 1282898]
    }
    
}
