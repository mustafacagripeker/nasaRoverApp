//
//  RoverPhotosCollectionViewCell.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 26.10.2021.
//

import UIKit

class RoverPhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = 8
    }

}
