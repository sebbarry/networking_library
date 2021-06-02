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
let environment = Environment.development
#else
let environment = Environment.production
#endif


extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = environment.baseURL()
        components.path = "/" + path
        components.queryItems = queryItems
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}


extension Endpoint {
    static var recommendations: Self {
        Endpoint(path: "recommendations/")
    }
    static func article(withId id: String) -> Self {
        Endpoint(path: "articles/\(id)")
    }
    static func search(for query: String,
                       maxResultCount: Int = 100) -> Self {
        Endpoint(path: "search/\(query)", queryItems: [URLQueryItem(name: "count", value: String(maxResultCount))])
    }
    
}

