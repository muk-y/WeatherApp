//
//  WeatherDetailInteractorIO.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

protocol WeatherDetailInteractorInput: AnyObject {
    
    func getData()
    func favourite(_ status: Bool?)

}

protocol WeatherDetailInteractorOutput: AnyObject {
    
    func obtained(_ model: WeatherDetailStructure)
    func obtained(_ error: Error)

}
