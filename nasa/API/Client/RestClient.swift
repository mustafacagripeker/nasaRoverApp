//
//  RestClient.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 30.10.2021.
//

import Alamofire
import Foundation

class RestClient {
    
    static var shared: RestClient {
        return RestClient()
    }
    fileprivate init(){ }
    
    func getData(_ urlStr: String,params:Dictionary<String,Any>? = nil,completion: @escaping (ApiResponse?) -> Void)  {
            
            if NetworkReachabilityManager()!.isReachable {
                let combineUrl = "\(Routes.baseUrl)\(urlStr)"
                let urlStr = combineUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                AF.request(urlStr!,
                    method: .get, parameters: params,
                    encoding: URLEncoding.queryString).responseJSON { response in
                            if response.data != nil && response.error == nil {
                                if response.response?.statusCode == 200 {
                                    let res : ApiResponse?
                                    res = ApiResponse(success: true, jsonData: response.data!, data: nil, message: nil)
                                    completion(res!)
                                }  else {
                                    completion(nil)
                                }
                            } else {
                                completion(nil)
                            }
                }
            }
        }
}

struct ApiResponse {
    var success: Bool
    var jsonData: Data?
    var data: [String: AnyObject]?
    var message: String?
}
extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
