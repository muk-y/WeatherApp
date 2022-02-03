//
//  Main.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import Foundation

class Main: Codable {
    
    var temperature : Double?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = try container.decodeIfPresent(Double?.self, forKey: .temperature) ?? nil
    }
    
}
