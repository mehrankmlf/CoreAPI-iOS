//
//  MockLoginService.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 3/20/1401 AP.
//

import Foundation
import Combine
@testable import CoreAPI_iOS

class MockLoginService : LoginServiceProtocol {
    var fetchedTokenResult : AnyPublisher<LoginResponse?, APIError>!
    func loginService(email: String, password: String) -> AnyPublisher<LoginResponse?, APIError> {
        return fetchedTokenResult
    }
}

class MockListService : UsersListProtocol {
    var fetchedListResult : AnyPublisher<BaseResponse<[UsersListResponse]>?, APIError>!
    func getUserData() -> AnyPublisher<BaseResponse<[UsersListResponse]>?, APIError> {
        return fetchedListResult
    }
}


