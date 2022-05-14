//
//  ListResponse.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import Foundation

struct UsersListResponse : Decodable {
    
    let id: Int?
    let email, firstName, lastName: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
