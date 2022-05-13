//
//  UIViewController + extension.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit

public extension UIViewController {

    /// The storyboard identifier for the controller
    static var storyboardIdentifier: String {
        self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}
