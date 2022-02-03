//
//  WeatherListInteractorIO.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

protocol WeatherListInteractorInput: AnyObject {
    
    func getData()

}

protocol WeatherListInteractorOutput: AnyObject {
    
    func obtained(_ models: [WeatherListStructure])
    func obtained(_ error: Error)

}
