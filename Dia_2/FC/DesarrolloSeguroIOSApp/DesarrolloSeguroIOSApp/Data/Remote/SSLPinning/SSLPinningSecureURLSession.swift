//
//  SSLPinningSecureURLSession.swift
//  DesarrolloSeguroIOSApp
//
//  Created by Ismael Sabri Pérez on 17/6/25.
//

import Foundation

class SSLPinningSecureURLSession {
    
    // MARK: - Variables
    let session: URLSession
    
    // MARK: - Initializers
    init() {
        session = URLSession(
            configuration: .ephemeral,
            delegate: SSLPinningDelegate(),
            delegateQueue: nil)
    }
    
}

extension URLSession {
    static var shared: URLSession {
        return SSLPinningSecureURLSession().session
    }
}
