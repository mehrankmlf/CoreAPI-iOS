//
//  Enums.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/22/1401 AP.
//

import UIKit

enum ViewModelStatus : Equatable {
    case loadStart
    case dismissAlert
}

enum Storyboard: String {

    case main = "Main"

    func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        return vc
    }
}


enum APIError : Error {
    case general
    case timeout
    case pageNotFound
    case noData
    case noNetwork
    case unknownError
    case serverError
    case statusMessage(message : String)
    case decodeError(String)
}

extension APIError {
    ///description of error
    var desc: String {
        
        switch self {
        case .general:                    return MessageHelper.serverError.general
        case .timeout:                    return MessageHelper.serverError.timeOut
        case .pageNotFound:               return MessageHelper.serverError.notFound
        case .noData:                     return MessageHelper.serverError.notFound
        case .noNetwork:                  return MessageHelper.serverError.noInternet
        case .unknownError:               return MessageHelper.serverError.general
        case .serverError:                return MessageHelper.serverError.serverError
        case .statusMessage(let message): return message
        case .decodeError(let error):     return error
        }
    }
}

enum BaseURLType {
    
    case baseApi
    case getMedia
    
    var desc : String {
        
        switch self {
            
        case .baseApi :
            return "https://reqres.in"
        case .getMedia :
            return "https://reqres.in/"
        }
    }
}

enum VersionType {
    case empty
    case v1, v2
    
    var desc : String {
        switch self {
        case .empty :
            return ""
        case .v1 :
            return "/v1"
        case .v2 :
            return "/v2"
        }
    }
}
