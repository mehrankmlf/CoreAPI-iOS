//
//  Login_Request.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/22/1401 AP.
//

import Foundation
import Combine

protocol LoginProtocol : AnyObject {
    func loginService(email : String, password : String) -> AnyPublisher <LoginResponse?, APIError>
}

class LoginRequest : BaseAPI<Networking>, LoginProtocol {
    
    func loginService(email : String, password : String) -> AnyPublisher<LoginResponse?, APIError> {
        self.fetchData(target: .login(email: email, password: password), responseClass: LoginResponse.self)
    }
}
