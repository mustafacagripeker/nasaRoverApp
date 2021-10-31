//
//  PhotoViewController.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 29.10.2021.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    let dataHandler =  PhotoDataHandler()
    var rover : Rover = .Curiosity
    var selectedCamera : NasaCamera?
    var availableCameras : [NasaCamera]?
    var page = 1
    var finishPagination = false
    var isLoading = false
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = rover.description
        
        collectionView.register(UINib(nibName: "RoverPhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RoverPhotosCollectionViewCell")
        
        collectionView.dataSource = dataHandler
        collectionView.delegate = dataHandler
        dataHandler.vc = self
        collectionView.reloadData()
        
        getPhotos()
    }
    
    func getPhotos(){
        isLoading = true
        Animation.showActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            PhotoService.shared.getPhotos(rover: self.rover.description, page: self.page , camera: self.selectedCamera == .ALL ? nil : self.selectedCamera?.description) { response in
                self.isLoading = false
                Animation.hideActivityIndicator()
                if self.dataHandler.photos == nil {
                    if !(response?.isEmpty ?? true){
                        self.page += 1
                    }else{
                        self.finishPagination = true
                    }
                    self.dataHandler.photos = response
                    self.collectionView.reloadData()
                }else{
                    if !(response?.isEmpty ?? true){
                        self.page += 1
                    }else{
                        self.finishPagination = true
                    }
                    self.dataHandler.photos?.append(contentsOf: response ?? [])
                    self.collectionView.reloadData()
                }
                self.checkEmpty()
            }
        }
    }
    
    
    func checkEmpty(){
        if self.dataHandler.photos?.count == 0{
            self.warningLabel.isHidden = false
        }else{
            self.warningLabel.isHidden = true
        }
    }
    
    @IBAction func filterAction(_ sender: Any) {
        let alert = UIAlertController(title: "Kamera Seç", message: "Fotoğraflarını görmek istediğiniz kamerayı seçin", preferredStyle: .actionSheet)
        
        for item in availableCameras ?? []{
            let action = UIAlertAction(title: item.description, style: .default, handler: { action in
                self.dataHandler.photos = []
                self.selectedCamera = item
                self.page = 1
                self.finishPagination = false
                self.getPhotos()
            })
            if let selectedCamera = self.selectedCamera {
                if selectedCamera.description == item.description{
                    action.setValue(UIColor.systemBlue, forKey: "titleTextColor")
                }else{
                    action.setValue(UIColor.darkGray, forKey: "titleTextColor")
                }
            }else if item.description == NasaCamera.ALL.description{
                action.setValue(UIColor.systemBlue, forKey: "titleTextColor")
            }else{
                action.setValue(UIColor.darkGray, forKey: "titleTextColor")
            }
            alert.addAction(action)
        }
        alert.addAction(UIAlertAction(title: "Kapat", style: .cancel, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert , animated: true)
    }
}




