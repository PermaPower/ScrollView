//
//  Extensions.swift
//  PlantCatalogue
//
//  Created by Mac on 12/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//
import UIKit

// Extension for addConstraintsWithFormat
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        // Enumerate views within viewsDictionary
        var viewsDictionary = [String: UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
