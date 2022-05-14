//
//  BaseResponse.swift
//  CoreAPI-iOS
//
//  Created by Mehran Kamalifard on 5/14/22.
//

import Foundation

class BaseResponse<T: Decodable>: Decodable {
    
    var page, perPage, total, totalPages: Int?
    var data: T?

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case data = "data"
        case totalPages = "total_pages"
    }
}
