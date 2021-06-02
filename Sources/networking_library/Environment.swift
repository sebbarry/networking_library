//
//  File.swift
//  
//
//  Created by Sebastian Barry on 6/2/21.
//

import Foundation

enum Environment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        switch self {
        case .development:
            return "\(domain())"
        case .staging:
            return ""
        case .production:
            return ""
        }
    }

    func domain() -> String {
        switch self {
        case .development:
            return "localhost:5000"//change on port
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
 
}
