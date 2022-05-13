//
//  BuildConfig.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/22/1401 AP.
//

import Foundation

struct BuildConfig : AppConfigurable {
    
    static var setAppState: AppConfiguration {
        // return help you to change thec AppConfigState
        return Realese()
    }
}

private struct Realese : AppConfiguration {
    
    var baseURL : String = BaseURLType.baseApi.desc
    var version : String = VersionType.empty.desc
    
    func isVPNConnected() -> Bool {
        return false
    }
    
    func isJailBrokenDevice() -> Bool {
        return false
    }
    
    func enableCertificatePinning() -> Bool {
        return false
    }
}

private struct Staging : AppConfiguration {
    
    var baseURL : String = BaseURLType.baseApi.desc
    var version : String = VersionType.v1.desc
    
    func isVPNConnected() -> Bool {
        return false
    }
    
    func isJailBrokenDevice() -> Bool {
        return false
    }
    
    func enableCertificatePinning() -> Bool {
        return false
    }
}
