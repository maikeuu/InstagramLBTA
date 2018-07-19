//
//  PhotoSelectorController.swift
//  InstagramLBTA
//
//  Created by Mike Lin on 7/18/18.
//  Copyright © 2018 Mike Lin. All rights reserved.
//

import UIKit

class PhotoSelectorController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .yellow
        
        setUpNavigationButtons()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func setUpNavigationButtons() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNext))
    }
    @objc
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    func handleNext() {
        print("Handling next")
    }
}
