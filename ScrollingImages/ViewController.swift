//
//  ViewController.swift
//  ScrollingImages
//
//  Created by Rex on 1/15/18.
//  Copyright © 2018 Xta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        // add scroll view
        self.scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        // add stack view
        self.stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 23.0
        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        // add images
        
        // via: https://unsplash.com/photos/Dq3LFhdmYcw
        stackView.addArrangedSubview(image(filename: "sarah"))
        
        // via: https://unsplash.com/photos/jIdKrtJF8Uk
        stackView.addArrangedSubview(image(filename: "amanda"))
        
        // via: https://unsplash.com/photos/VrlNDUdnOGM
        stackView.addArrangedSubview(image(filename: "paul"))
        
        // via: https://unsplash.com/photos/6k2FqycNmwU
        stackView.addArrangedSubview(image(filename: "pawel"))
    }
    
    // note: function is a proof of concept helper (not intended for production)
    func image(filename: String) -> UIImageView {
        let img = UIImage(named: filename)
        let imgView = UIImageView(image: img)
        
        let width = view.frame.width
        var height = view.frame.width
        
        let imgWidth = img!.size.width
        let imgHeight = img!.size.height
        height = height*(imgHeight/imgWidth)
        
        imgView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return imgView
    }

}

