//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

class WeatherData: ResponseMessage {
    
    var location : String?
    var weatherConditions: [WeatherCondition]?
    var sys: Sys?
    var main: Main?
    var wind: Wind?
    
    enum CodingKeys: String, CodingKey {
        case location = "name"
        case weatherConditions = "weather"
        case sys,
             main,
             wind
    }
    
    required init(from decoder: Decoder) throws {
        try! super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decodeIfPresent(String?.self, forKey: .location) ?? nil
        weatherConditions = try container.decodeIfPresent([WeatherCondition]?.self, forKey: .weatherConditions) ?? nil
        sys = try container.decodeIfPresent(Sys?.self, forKey: .sys) ?? nil
        main = try container.decodeIfPresent(Main?.self, forKey: .main) ?? nil
        wind = try container.decodeIfPresent(Wind?.self, forKey: .wind) ?? nil
    }
    
}
