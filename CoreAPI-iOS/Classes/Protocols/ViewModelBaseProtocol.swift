//
//  ViewModelBaseProtocol.swift
//  CoreAPI-iOS
//
//  Created by Mehran Kamalifard on 5/15/22.
//

import Foundation
import Combine

// MARK: BaseViewModel

enum ViewModelStatus : Equatable {
    case loadStart
    case dismissAlert
}

protocol ViewModelBaseProtocol {
    var loadinState : CurrentValueSubject<ViewModelStatus, Never> { get set }
    var subscriber : Set<AnyCancellable> { get }
}


//LoginViewModel
typealias loginViewModel = ViewModelBaseProtocol & LoginViewModelBaseProtocol

protocol LoginViewModelBaseProtocol {
    func callLoginService(email : String, password : String)
}

//ListViewModel
typealias listViewModel = ViewModelBaseProtocol & ListViewModelBaseProtocol

protocol ListViewModelBaseProtocol {
    func callUserListServie()
}


