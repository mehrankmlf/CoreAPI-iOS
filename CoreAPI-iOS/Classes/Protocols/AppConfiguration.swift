//
//  AppConfiguration.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/22/1401 AP.
//

import Foundation
import Combine

//MARK: - Protocols

// App Configuration Base
protocol AppConfiguration {
    
    var baseURL : String { get }
    
    var version : String { get }
    
    func isVPNConnected() -> Bool
    func isJailBrokenDevice() -> Bool
    func enableCertificatePinning() -> Bool
}

// App Configuration Set Base
protocol AppConfigurable {
    static var setAppState : AppConfiguration { get }
}



