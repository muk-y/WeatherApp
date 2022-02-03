//
//  WeatherDetailService.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

import Foundation
import Combine

class WeatherDetailService: WeatherDetailServiceType {
    
    //MARK: Properties
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Other functions
    func fetchWeather(of id: Int, completion: @escaping (Result<WeatherData, Error>) -> ()) {
        NetworkManager.shared.getData(endpoint: .fetchWeather(id: id), type: WeatherData.self)
            .sink { finished in
                switch finished {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            }
            receiveValue: { weatherData in
                completion(.success(weatherData))
            }
            .store(in: &cancellables)
    }
    
}
