//
//  Sys.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import Foundation

class Sys: Codable {
    
    var country : String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decodeIfPresent(String?.self, forKey: .country) ?? nil
    }
    
}
