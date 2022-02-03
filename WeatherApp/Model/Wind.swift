//
//  Wind.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import Foundation

class Wind: Codable {
    
    var speed : Double?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        speed = try container.decodeIfPresent(Double?.self, forKey: .speed) ?? nil
    }
    
}
