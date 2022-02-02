//
//  WeatherListInteractorIO.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

protocol WeatherListInteractorInput: class {
    
    func getData()

}

protocol WeatherListInteractorOutput: class {
    
    func obtained(_ models: [WeatherListStructure])
    func obtained(_ error: Error)

}
