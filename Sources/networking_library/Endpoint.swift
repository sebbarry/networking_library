//
//  File.swift
//  
//
//  Created by Sebastian Barry on 6/1/21.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}


#if DEBUG
let environment = ApplicationEnvironment.development
#endif


extension Endpoint {
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = environment.baseURL()
        components.path = "/" + path
        if(queryItems.count != 0) {
            components.queryItems = queryItems
        }
        components.port = environment.getPort()
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        print(components)
        return url
    }
}


enum LeadStatus: Int {
    case pickup = 2
    case finished = 3
}


extension Endpoint {
    
    //MARK:-Login Endopints
    static var login: Self {
        return Endpoint(path: "login/")
    }
    
    //MARK:-Lead endpoints
    static func lead(withId id: String) -> Self {
        //get the enterprise id from storage?
        Endpoint(path: "enterprise/\(getEnterpriseId())/lead/\(id)")
    }
    static func leads() -> Self {
        Endpoint(path: "enterprise/\(getEnterpriseId())/lead")
    }
    static func lead(withId id: String, onWhatLeadStatus status: LeadStatus) -> Self{
        Endpoint(path: "enterprise/\(getEnterpriseId())/lead/\(id)", queryItems: [URLQueryItem(name: "type", value: String(status.rawValue))])
    }
    
    //MARK:-Inventory endpoints
    static func inventory(withId id: String) -> Self {
       Endpoint(path: "enterprise/\(getEnterpriseId())/inventory/\(id)")
    }
    static func inventory() -> Self {
        Endpoint(path: "enterprise/\(getEnterpriseId())/inventory")
    }
    
    
    //MARK:-Customer endpoints
    static func customer(withId id: String) -> Self {
        Endpoint(path: "enterprise/\(getEnterpriseId())/customer/\(id)")
    }
    static func customers() -> Self {
        Endpoint(path: "enterprise/\(getEnterpriseId())/customer")
    }
    
    
    //MARK:-Associate endpoints
    static func associate(withId id: String) -> Self {
        Endpoint(path: "enterprise/\(getEnterpriseId())/associate/\(id)")
    }
    static func associates() -> Self {
        Endpoint(path: "enterprise/\(getEnterpriseId())/associate")
    }

}

func getEnterpriseId() -> String {
    return ""
}

