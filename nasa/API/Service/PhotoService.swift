//
//  PhotoService.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 30.10.2021.
//

import Foundation

class PhotoService {
    
    static var shared: PhotoService {
        return PhotoService()
    }
    
    fileprivate init(){ }
    
    func getPhotos(rover : String , sol : Int? = 1000 , page : Int , camera : String?,completion: @escaping ([PhotoModel]?) -> Void ){
        
        var params = [String : Any]()
        
        params["sol"] = sol
        params["camera"] = camera
        params["api_key"] = Routes.api_key
        params["page"] = page
        
        let urlString = "\(rover)/photos"
        
        RestClient.shared.getData(urlString, params: params) { response in
            
            if let data = response?.jsonData{
                do {
                    let jsonData = try JSONDecoder().decode(PhotoResponse.self, from: data)
                    completion(jsonData.photos)
                } catch _ {
                    completion([])
                }
            }else{
                completion([])}
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
