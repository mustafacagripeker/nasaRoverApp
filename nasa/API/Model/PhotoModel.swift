//
//  PhotoModel.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 30.10.2021.
//

import Foundation

struct PhotoResponse : Codable{
    
    let photos : [PhotoModel]?
    
}


struct PhotoModel : Codable {
    
    let img_src : String
    let earth_date : String
    let rover : RoverModel
    let camera : CameraModel
}


struct RoverModel : Codable {
    
    let name : String
    let landing_date : String
    let launch_date : String
    let status : String
}

struct CameraModel : Codable {
    let name : String
}


enum Rover : String,Codable,CustomStringConvertible {
    var description: String{
        return self.rawValue
    }
    
    case Curiosity
    case Opportunity
    case Spirit
}


enum NasaCamera : String,Codable,CustomStringConvertible {
    var description: String{
        return self.rawValue
    }
    case ALL
    case FHAZ
    case RHAZ
    case MAST
    case CHEMCAM
    case MAHLI
    case MARDI
    case NAVCAM
    case PANCAM
    case MINITES
}
