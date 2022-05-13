//
//  LoginViewModel.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject {
    
   @Published var loginData : LoginResponse?
    
    var getTokenData: LoginProtocol
    var subscriber = Set<AnyCancellable>()
    
    init(getTokenData : LoginProtocol = LoginRequest()) {
        self.getTokenData = getTokenData
    }
}

extension LoginViewModel {
    func callLoginService(email : String, password : String) {
        self.getTokenData.loginService(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { data in
                print(data)
            } receiveValue: { [weak self] data in
                guard let data = data else {return}
                self?.loginData = data
            }
            .store(in: &subscriber)
    }
}
