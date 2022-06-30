//
//  CoreAPIEnums.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 3/22/1401 AP.
//

import Foundation

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
