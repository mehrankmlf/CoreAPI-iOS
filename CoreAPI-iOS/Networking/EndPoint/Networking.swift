//
//  Networking.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/22/1401 AP.
//

import Foundation
import Alamofire

enum Networking {
    case login(email:String, password: String)
    case users
}

extension Networking : TargetType {
    
    var baseURL: String {
        return BuildConfig.setAppState.baseURL
    }
    
    var version: String {
        return BuildConfig.setAppState.version
    }
    
    var path: RequestType {
        switch self {
        case .login:
            return .requestPath(path: "/api/login")
        case .users:
            return .requestPath(path: "/api/users")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .users:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password" : password], encoding:JSONEncoding.default)
        case .users:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default :
            return ["Content-Type":"application/json"]
        }
    }
}
