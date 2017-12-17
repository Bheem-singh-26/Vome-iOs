//
//  APIManager.swift
//  TransportMap
//
//  Created by Bheem Singh on 17/08/17.
//  Copyright © 2017 Sonia Yadav. All rights reserved.
//

import Foundation
import Alamofire

class APImanager {
    
    fileprivate static let baseUrl = "https://vomedev.azurewebsites.net/"
    
    enum APIService{
        
        case login(username: String, password: String)
        case register(username: String, password: String, userType:String)
        case payment
        
        var path: String {
            switch self {
            case .login:
                return baseUrl + "Token"
            case .register:
                return baseUrl + "api/profileapi/RegisterUser"
                
            default:
                return ""
            }
        }
        
        var parameters: [String: Any] {
            switch self {
            case let .login(username, password):
                let params = ["grant_type": "password","username": username, "password": password]
                return params
                
            case let .register(username, password, userType):
                let params = ["Email": username, "Password": password, "PosterType": userType, "ConfirmPassword": password]
                return params
                
            default:
                return ["": ""]
            }
        }
        
        var method: HTTPMethod {
            
            switch self {
            case .login, .register:
                return .post
                
            default:
                return .get
            }
        }
        
        
        
    }
    
    class func login(apiService: APIService, handler: @escaping (_ user: LoginToken?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectModel = LoginToken(JSON: response as! [String : Any])
            handler(objectModel, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }
    
    class func register(apiService: APIService, handler: @escaping (_ user: LoginToken?, _ error: AnyObject?) -> ()) {
        
        NetworkManager.shareInstance.callServiceWithName(apiService.path, method: apiService.method, param: apiService.parameters, callbackSuccess: { (response) in
            
            let objectModel = LoginToken(JSON: response as! [String : Any])
            handler(objectModel, nil)
            
        }) { (failureResponse) in
            print(failureResponse as Any)
            handler(nil, failureResponse)
            
        }
    }
    
    
    
}
