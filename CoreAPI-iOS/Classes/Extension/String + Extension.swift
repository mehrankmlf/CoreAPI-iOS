//
//  String + Extension.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import Foundation

extension String {
    
    static func isNilOrEmpty(string: String?) -> Bool {
        
        guard let value = string else { return true }

        return value.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
