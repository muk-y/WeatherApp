//
//  BaseViewInterface.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import UIKit.UIAlertController

protocol BaseViewInterface {
    
    func alert(message: String?)
    func showLoading()
    func hideLoading()
    
}
