//
//  UIViewController+Extension.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import UIKit.UIViewController

extension UIViewController {
    
    func alert(message: String?) {
        let alertController = getAlert(message: message, title: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        alertController.modalPresentationStyle = .fullScreen
        present(alertController, animated: true, completion: nil)
    }
    
    private func getAlert(message: String?, title: String?, style: UIAlertController.Style? = .alert) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
}
