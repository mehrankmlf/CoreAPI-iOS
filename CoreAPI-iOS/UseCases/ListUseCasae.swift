//
//  ListUseCasae.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 7/3/1401 AP.
//

import Foundation
import Combine

protocol UsersListProtocol {
    func getUserData() -> AnyPublisher<BaseResponse<[UsersListResponse]>?, APIError>
}

class UserListRequest : BaseAPI<Networking>, UsersListProtocol {
    func getUserData() -> AnyPublisher<BaseResponse<[UsersListResponse]>?, APIError> {
        self.fetchData(target: .users, responseClass: BaseResponse<[UsersListResponse]>.self)
    }
}
