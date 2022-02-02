//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case responseError
    case unknown
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .responseError:
            return "Unexpected status code"
        case .unknown:
            return "Something went wrong"
        }
    }
    
}
