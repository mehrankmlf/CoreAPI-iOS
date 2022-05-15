//
//  LoginViewModel.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject, ViewModelBaseProtocol {
    
    private var getTokenData: LoginProtocol
    
    var loadinState = CurrentValueSubject<ViewModelStatus, Never>(.dismissAlert)
    var subscriber = Set<AnyCancellable>()
    @Published var loginData : LoginResponse?
    
    init(getTokenData : LoginProtocol = LoginRequest()) {
        self.getTokenData = getTokenData
    }
}

extension LoginViewModel {
    func callLoginService(email : String, password : String) {
        self.loadinState.send(.loadStart)
        self.getTokenData.loginService(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { data in
                self.loadinState.send(.dismissAlert)
            } receiveValue: { [weak self] data in
                guard let data = data else {return}
                self?.loginData = data
            }
            .store(in: &subscriber)
    }
}
