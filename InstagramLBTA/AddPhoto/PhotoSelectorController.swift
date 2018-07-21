//
//  PhotoSelectorController.swift
//  InstagramLBTA
//
//  Created by Mike Lin on 7/18/18.
//  Copyright © 2018 Mike Lin. All rights reserved.
//

import UIKit
import Photos

class PhotoSelectorController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    let headerID = "headerID"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .yellow
        
        setUpNavigationButtons()
        
        collectionView?.register(PhotoSelectorCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        
        fetchPhotos()
        
    }
    
    var images = [UIImage]()
    
    
    fileprivate func fetchPhotos() {
        print("Fetching photos")
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 10
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchOptions.sortDescriptors = [sortDescriptor]
        let allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        allPhotos.enumerateObjects { (asset, count, stop) in
            print(asset)
            
            let imageManager = PHImageManager.default()
            let targetSize = CGSize(width: 350, height: 350)
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit , options: options, resultHandler: { (image, info) in
                if let image = image {
                    self.images.append(image)
                }
                
                if count == allPhotos.count - 1 {
                    self.collectionView?.reloadData()
                }
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(1, 0, 0, 0)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        header.backgroundColor = .red
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 3) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PhotoSelectorCell
        cell.photoImageView.image = images[indexPath.item]
        return cell
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
