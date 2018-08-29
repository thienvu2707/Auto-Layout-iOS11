//
//  ViewController.swift
//  auto_layout_swift4
//
//  Created by Thien Vu Le on Jul/27/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bearFirstImage: UIImageView = {
        let imageView                                       = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        //this enabling auto layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode                               = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView                                       = UITextView()
        
        let attributedText                                 = NSMutableAttributedString(string: "Join us today for fun and games!", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\nAre you ready for lots of lots of fun for this article that we gonna do right now right here. Are you having fun yet?", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText                            = attributedText
        
//        textView.text = "Join us today for fun and games!"
//        textView.font = .boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment                             = .center
        textView.isEditable                                = false
        return textView
    }()
    
    private let previousButton : UIButton = {
        let button                                       = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font                          = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton : UIButton = {
        let button                                       = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
//        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font                          = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage                               = 0
        pageControl.numberOfPages                             = 4
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor             = .blue
        pageControl.pageIndicatorTintColor                    = .gray
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(bearFirstImage)
        view.addSubview(descriptionTextView)
        
        setupBottomControl()
        
        setupLayout()
    }
    
    fileprivate func setupBottomControl() {
//        view.addSubview(previousButton)
//        previousButton.backgroundColor = .red
//        previousButton.frame = CGRect(x: 0, y: 100, width: 200, height: 50)
        
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
        
//        let greenView = UIView()
//        greenView.backgroundColor = .green
        
//        let blueiew = UIView()
//        blueiew.backgroundColor = .blue
        
        let bottomOfStackView                                       = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomOfStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomOfStackView.distribution                              = .fillEqually
        view.addSubview(bottomOfStackView)
        
        NSLayoutConstraint.activate([
//            previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomOfStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomOfStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomOfStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomOfStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    //Setting up the constraint layout
    func setupLayout() {
        
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor                                                                         = .blue
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints                                               = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive                                  = true
        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive                                = true
        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive                              = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive           = true
        topImageContainerView.addSubview(bearFirstImage)
        
        bearFirstImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive                = true
        bearFirstImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive                = true
        bearFirstImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
//        bearFirstImage.widthAnchor.constraint(equalToConstant: 200).isActive                                = true
//        bearFirstImage.heightAnchor.constraint(equalToConstant: 200).isActive                               = true
        
        //Constraint for imageView
//        bearFirstImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        bearFirstImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        bearFirstImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        bearFirstImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        //constraint for text view
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive    = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive        = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive     = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive     = true
    }
}

