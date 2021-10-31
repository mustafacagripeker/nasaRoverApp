//
//  PhotoDetailViewController.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 30.10.2021.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var earthDateLabel: UILabel!
    @IBOutlet weak var roverNameLabel: UILabel!
    @IBOutlet weak var cameraNameLabel: UILabel!
    @IBOutlet weak var roverStatusLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    @IBOutlet weak var landingDateLabel: UILabel!
    
    var photoModel : PhotoModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateData()
        
        popUpView.layer.cornerRadius = 8
        popUpView.clipsToBounds = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.closeAction)))
        self.popUpView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.detailAction)))
    }
    
    func populateData(){
        if let data = photoModel{
            if let url = URL(string: data.img_src){
               photoImageView.kf.setImage(with: url)
            }
            earthDateLabel.text = "Çekildiği Tarih : \(data.earth_date)"
            roverNameLabel.text = "Araç Adı : \(data.rover.name)"
            cameraNameLabel.text = "Kamera Adı : \(data.camera.name)"
            roverStatusLabel.text = "Araç Durumu : \(data.rover.status)"
            launchDateLabel.text = "Fırlatma Tarihi : \(data.rover.launch_date)"
            landingDateLabel.text = "İniş Tarihi : \(data.rover.landing_date)"
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    @objc func closeAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func detailAction(sender : UITapGestureRecognizer) {
    
    }

}
