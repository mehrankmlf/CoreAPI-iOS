//
//  MockEndPoint.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/21/1401 AP.
//

import Foundation

@testable import CoreAPI_iOS

class  MockEndPoint : TargetType {
    
    var baseURL: String = "www.testUrl.com"
    var version: String = "v1"
    var path: RequestType = .requestPath(path: "test")
    var method: HTTPMethod = .post
    var task: Task = .requestParameters(parameters: ["test" : 1], encoding: .default)
    var headers: [String : String]? = ["header": "header"]
}
