//
//  ApiResponse.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import Foundation

class ResponseMessage: Codable {
    
    var message : String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decodeIfPresent(String?.self, forKey: .message) ?? nil
    }
    
}
