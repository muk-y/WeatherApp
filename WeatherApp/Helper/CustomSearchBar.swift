//
//  CustomSearchBar.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: View functions
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    //MARK: Other functions
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        barTintColor = .clear
        searchBarStyle = .minimal
        tintColor = .darkGray
        elevate(4)
        textField?.backgroundColor = .white
        textField?.borderStyle = .none
        textField?.curve = 8
        textField?.font = CustomFont.regular.of(.heading3)
        textField?.textColor = UIColor(hex: "#3B3B3B")
        if let leftView = textField?.leftView as? UIImageView {
            leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
            leftView.tintColor = UIColor(hex: "#BDBDBD")
        }
        let toolbar = UIToolbar(frame: CGRect(x: .zero,
                                              y: .zero,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(tapDone))//3
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        textField?.inputAccessoryView = toolbar
    }
    
    private func elevate(_ elevation: Double, color: UIColor = UIColor.black.withAlphaComponent(0.8)) {
        if elevation == .zero {
            layer.shadowOpacity = .zero
        } else {
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOffset = CGSize(width: .zero, height: elevation)
            layer.shadowRadius = abs(CGFloat(elevation))
            layer.shadowOpacity = 0.24
        }
    }
    
    @objc func tapDone() {
        textField?.resignFirstResponder()
    }
    
}
