//
//  SwipingController.swift
//  auto_layout_swift4
//
//  Created by Thien Vu Le on Aug/20/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageNames: "bear_first", headerText: "Join us today for fun and games!", bodyText: "Are you ready for lots of lots of fun for this article that we gonna do right now right here. Are you having fun yet?"),
        Page(imageNames: "heart_second", headerText: "Subscribe and get daily coupon on daily events", bodyText: "Get modified for the saving immediately when we announce them on the website. Make sure to give us any feedback you have"),
        Page(imageNames: "leaf_third", headerText: "VIP members special services", bodyText: "")
    ]
    
//    let imageNames = ["bear_first", "heart_second", "leaf_third"]
//
//    let headerStrings = ["Join us today for fun and games!", "Subscribe and get daily coupon on daily events", "VIP members special services"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
//        cell.bearFirstImage.image = UIImage(named: page.imageNames)
//        cell.descriptionTextView.text = page.headerText
        
//        let imageName = imageNames[indexPath.item]
//
//        cell.bearFirstImage.image = UIImage(named: imageName)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
