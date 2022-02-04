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
    
    //MARK: Loading
    private static let association = ObjectAssociation<UIActivityIndicatorView>()
    var activityIndicatorView: UIActivityIndicatorView {
        set { UIViewController.association[self] = newValue }
        get {
            if let indicator = UIViewController.association[self] {
                return indicator
            } else {
                UIViewController.association[self] = UIActivityIndicatorView.customIndicator(at: view.center)
                return UIViewController.association[self]!
            }
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async { [weak self] in
            if let activityIndicatorView = self?.activityIndicatorView {
                self?.view.addSubview(activityIndicatorView)
            }
            self?.activityIndicatorView.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicatorView.removeFromSuperview()
            self?.activityIndicatorView.stopAnimating()
        }
    }
    
}
