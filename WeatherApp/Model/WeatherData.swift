//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

class WeatherData: Codable {
    
    var location : String?
    var weatherConditions: [WeatherCondition]?
    
    enum CodingKeys: String, CodingKey {
        case location = "name"
        case weatherConditions = "weather"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decodeIfPresent(String?.self, forKey: .location) ?? nil
        weatherConditions = try container.decodeIfPresent([WeatherCondition]?.self, forKey: .weatherConditions) ?? nil
    }
    
}
