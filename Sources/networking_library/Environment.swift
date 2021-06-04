//
//  File.swift
//  
//
//  Created by Sebastian Barry on 6/2/21.
//

import Foundation

enum ApplicationEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        switch self {
        case .development:
            return "\(domain())"
        case .staging:
            return "\(domain())"
        case .production:
            return "\(domain())"
        }
    }

    func domain() -> String {
        switch self {
        case .development:
            return "localhost"//change on port
        case .staging:
            return "";
        case .production:
            return "";
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .staging, .production:
            return ""
        }
    }
    
    func getPort() -> Int {
        switch self {
        case .development, .staging, .production:
            return 5000//switch on port
        }
    }
 
}

