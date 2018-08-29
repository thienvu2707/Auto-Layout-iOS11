//
//  PageCell.swift
//  auto_layout_swift4
//
//  Created by Thien Vu Le on Aug/20/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page : Page? {
        didSet {
//            print(page?.imageNames)
            
            guard let unwrappedPage = page else { return }
            
            bearFirstImage.image    = UIImage(named: unwrappedPage.imageNames)
            
            let attributedText      = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    
    private let bearFirstImage: UIImageView = {
        let imageView                                       = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        //this enabling auto layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode                               = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
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
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout() {
        
        let topImageContainerView = UIView()
        //        topImageContainerView.backgroundColor                                                                         = .blue
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints                                          = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive                                  = true
        topImageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive                                = true
        topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive                              = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive           = true
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
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive    = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive             = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive          = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive          = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
