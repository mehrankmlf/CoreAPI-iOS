//
//  ViewModelBaseProtocol.swift
//  CoreAPI-iOS
//
//  Created by Mehran Kamalifard on 5/15/22.
//

import Foundation
import Combine

// MARK: BaseViewModel

protocol ViewModelBaseProtocol {
    var loadinState : CurrentValueSubject<ViewModelStatus, Never> { get set }
    var subscriber : Set<AnyCancellable> { get }
}
