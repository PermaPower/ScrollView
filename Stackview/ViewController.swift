//
//  ViewController.swift
//  Stackview
//
//  Created by David on 23/2/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = view.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        scrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)


        let horizontalConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        
        let scrollViews = ["scrollView": scrollView]
        let swidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: scrollViews)
        let sheightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: scrollViews)
        
        NSLayoutConstraint.activate(swidthConstraints)
        NSLayoutConstraint.activate(sheightConstraints)
        
        scrollView.backgroundColor = .red
        
        
        // View 1  //
        
        let label = UILabel(frame: CGRect.zero)
        label.text = "Nothing to show"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // View 2 //
        
        let label2 = UILabel(frame: CGRect.zero)
        label2.text = "Happy"
        label2.textAlignment = .center
        label2.backgroundColor = .white
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        // View 3 //
        
        let label3 = UILabel(frame: CGRect.zero)
        label3.text = "Insert ME!!!"
        label3.textAlignment = .center
        label3.backgroundColor = .white
        label3.translatesAutoresizingMaskIntoConstraints = false
        
        // View 4 //
        
        let catView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cat")
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        // StackView //
        
        let stackView = UIStackView(arrangedSubviews: [label2,catView, label])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // Inserts view inbetween views //
        stackView.insertArrangedSubview(label3, at: 1)
        
        // Add View 1 constraints to stackview //
        stackView.addSubview(label)
        stackView.addSubview(label2)
        
        let widthConstraint = NSLayoutConstraint(item: label,
                                                 attribute: NSLayoutAttribute.width,
                                                 relatedBy: NSLayoutRelation.equal,
                                                 toItem: scrollView,
                                                 attribute: NSLayoutAttribute.width,
                                                 multiplier: 1, constant: 0)
        
        view.addConstraint(widthConstraint)
        
        
        // scroll size should equal the total of the views height //
        scrollView.contentSize.height = 1000
        
//        scrollView.isScrollEnabled = true
//        scrollView.isDirectionalLockEnabled = true
        
        
    }
    
    
}

