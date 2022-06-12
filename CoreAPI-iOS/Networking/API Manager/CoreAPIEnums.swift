//
//  CoreAPIEnums.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 3/22/1401 AP.
//

import Foundation

enum HTTPStatusCode: Int {
    //1xx Informationals
    case `continue` = 100
    case switchingProtocols = 101
    //2xx Successfuls
    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    //3xx Redirections
    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModified = 304
    case useProxy = 305
    case unused = 306
    case temporaryRedirect = 307
    //4xx Client Errors
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case requestEntityTooLarge = 413
    case requestURITooLong = 414
    case unsupportedMediaType = 415
    case requestedRangeNotSatisfiable = 416
    case expectationFailed = 417
    //5xx Server Errors
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case httpVersionNotSupported = 505
    //10xx Internet Error
    case noInternetConnection = -1009
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
