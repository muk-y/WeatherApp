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
                    guard response is HTTPURLResponse else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        var errorDescription: String?
                        switch error {
                        case let decodingError as DecodingError:
                            errorDescription = decodingError.errorDescription
                        case let apiError as NetworkError:
                            errorDescription = apiError.errorDescription
                        default:
                            errorDescription = NetworkError.unknown.errorDescription
                        }
                        promise(.failure(NSError(domain: "error", code: 22, userInfo: [NSLocalizedDescriptionKey: errorDescription ?? NetworkError.unknown.errorDescription])))
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
    
}
