//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation
import Combine

class NetworkManager {
    
    //MARK: Properties
    static let shared = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    //MARK: Initializers
    private init() {}
    
    //MARK: Other functions
    func getData<T: Decodable>(endpoint: Endpoint, type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            guard let self = self, let url = URL(string: self.baseURL.appending(endpoint.path) + "&appid=\(GlobalConstants.API_KEY)") else {
                return promise(.failure(NetworkError.invalidURL))
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
    
}
