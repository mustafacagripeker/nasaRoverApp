//
//  PhotoDataHandler.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 30.10.2021.
//

import Foundation
import UIKit
import Kingfisher
import SwiftUI



class PhotoDataHandler : NSObject , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    var vc : PhotoViewController?
    var photos : [PhotoModel]?
    let space = 3
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoverPhotosCollectionViewCell", for: indexPath) as! RoverPhotosCollectionViewCell
        
        if let url = URL(string: photos?[indexPath.row].img_src ?? ""){
            cell.imgView.kf.setImage(
                with: url
                )
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoDetailViewController") as! PhotoDetailViewController
        
        viewController.photoModel = photos?[indexPath.row]
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        vc?.present(viewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == photos!.count - 1 && !(vc!.isLoading) && !vc!.finishPagination{
            vc?.getPhotos()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Int(collectionView.frame.size.width) / 2) - (space / 2) , height: (Int(collectionView.frame.size.width) / 2) - space)
    }
    
    
    
}
