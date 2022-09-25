//
//  LoginUseCase.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 7/3/1401 AP.
//

import Foundation
import Combine

protocol LoginServiceProtocol : AnyObject {
    func loginService(email : String, password : String) -> AnyPublisher <LoginResponse?, APIError>
}

class LoginRequest : BaseAPI<Networking>, LoginServiceProtocol {
    
    func loginService(email : String, password : String) -> AnyPublisher<LoginResponse?, APIError> {
        self.fetchData(target: .login(email: email, password: password), responseClass: LoginResponse.self)
    }
}
