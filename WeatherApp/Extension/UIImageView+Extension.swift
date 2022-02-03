//
//  UIImageView+Extension.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import UIKit.UIImageView
import UIKit.UIActivityIndicatorView

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func showImage(with urlString: String?) {
        guard let urlString = urlString else {
            return
        }
        let url = URL(string: urlString)
        if url == nil { return }
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .white
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = center

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }
        }).resume()
    }
    
}
