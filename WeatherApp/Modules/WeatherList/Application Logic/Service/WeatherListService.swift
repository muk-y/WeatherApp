//
//  WeatherListService.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

import Foundation
import Combine

class WeatherListService: WeatherListServiceType {
    
    //MARK: Properties
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Other functions
    func fetchWeatherData(city: String? = nil, id: Int? = nil, completion: @escaping (Result<WeatherData, Error>) -> ()) {
        NetworkManager.shared.getData(endpoint: city == nil ? .fetchWeather(id: id ?? .zero) : .fetchCityWeather(city: city ?? ""), type: WeatherData.self)
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
