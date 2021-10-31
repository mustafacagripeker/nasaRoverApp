//
//  PhotoViewController.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 29.10.2021.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    let dataHandler = PhotoDataHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(UINib(nibName: "RoverPhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RoverPhotosCollectionViewCell")
        
        collectionView.dataSource = dataHandler
        collectionView.delegate = dataHandler
        collectionView.reloadData()
    }
    
    @IBAction func filterAction(_ sender: Any) {
    }
    

}



