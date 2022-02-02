//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

class WeatherCondition: Codable {
    
    var title : String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "main"
        case icon
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String?.self, forKey: .title) ?? nil
        icon = try container.decodeIfPresent(String?.self, forKey: .icon) ?? nil
    }
    
}
