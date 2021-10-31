//
//  PhotoDataHandler.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 30.10.2021.
//

import Foundation
import UIKit


class PhotoDataHandler : NSObject , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    let space = 5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoverPhotosCollectionViewCell", for: indexPath) as! RoverPhotosCollectionViewCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Int(collectionView.frame.size.width) / 2) - space , height: (Int(collectionView.frame.size.width) / 2) - space)
    }
    
    
    
}
