//
//  ListRequest.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import Foundation
import Combine

protocol UsersListProtocol {
    func getUserData() -> AnyPublisher<UsersListResponse?, APIError>
}

class UserListRequest : BaseAPI<Networking>, UsersListProtocol {
    func getUserData() -> AnyPublisher<UsersListResponse?, APIError> {
        self.fetchData(target: .users, responseClass: UsersListResponse.self)
    }
}

