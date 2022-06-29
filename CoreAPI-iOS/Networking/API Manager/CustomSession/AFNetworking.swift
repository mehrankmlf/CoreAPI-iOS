//
//  AFNetworking.swift
//  CoreAPI-iOS
//
//  Created by Mehran Kamalifard on 6/29/22.
//

import Alamofire

protocol AFNetwrokingProtocol {
    var session : Session { get }
    init(allHostsMustBeEvaluated: Bool)
}

class AFNetworking : AFNetwrokingProtocol {
    
    /// defined certificates for Certificate pinning
    private let certificates = [
        "sni.cloudflaressl.com":
            PinnedCertificatesTrustEvaluator(certificates: [Certificates.cloudFlare],
                                             acceptSelfSignedCertificates: false,
                                             performDefaultValidation: true,
                                             validateHost: true)
    ]
    
    let session: Session
    
    /// init method for AlamofireNetworking
    ///
    /// - Parameter allHostsMustBeEvaluated: it configures certificate pinning behaviour
    /// if true: Alamofire will only allow communication with hosts defined in evaluators and matching defined Certificates.
    /// if false: Alamofire will check certificates only for hosts defined in evaluators dictionary. Communication with other hosts than defined will not use Certificate pinning
    required init(allHostsMustBeEvaluated: Bool) {
        
        let serverTrustPolicy = ServerTrustManager(
            allHostsMustBeEvaluated: allHostsMustBeEvaluated,
            evaluators: certificates
        )
        
        session = Session(serverTrustManager: serverTrustPolicy, eventMonitors: [AlamofireLogger()])
    }
//
//    /// send certificate pinned request
//    ///
//    /// - Parameter convertible: request to send
//    func request(_ convertible: URLRequestConvertible) -> DataRequest {
//        return session.request(convertible)
//    }
}
