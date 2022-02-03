//
//  GlobalConstants.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

struct GlobalConstants {
    
    static let API_KEY = "2d4e852a3aa6c57f13e19c8bf611a9d7"
    static let IMAGE_BASE_URL = "https://openweathermap.org/img/wn/"
    
    struct Notification {
        
        let name: String
        
        var notificationName: NSNotification.Name {
            return NSNotification.Name(rawValue: name)
        }
        
        func fire(with object: Any? = nil) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: object)
        }
        
        static let didGetWeather: Notification = Notification(name: "didGetWeather")
        
    }
    
}
