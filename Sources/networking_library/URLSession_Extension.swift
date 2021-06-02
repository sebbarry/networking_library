//
//  File.swift
//  
//
//  Created by Sebastian Barry on 6/1/21.
//

import Foundation




//TODO improve this. add headers extensions?



extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult//makes handling the task optional
    func get(
        _ endpoint: Endpoint,
        then handler: @escaping Handler
    ) -> URLSessionDataTask {
        let task = dataTask(with: endpoint.url, completionHandler: handler)
        task.resume()
        return task
    }
    
    func sendPostRequest(
        _ endpoint: Endpoint,
        isSecure: Bool?,//sends a cookie with the request.
        body: Data?,
            then handler: @escaping Handler
        ) -> URLSessionDataTask {
        var request = URLRequest(
            url: endpoint.url,
            cachePolicy: .reloadIgnoringLocalCacheData
        )

        request.httpMethod = "POST"
        if let body = body {
            request.httpBody = body
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        if let _ = isSecure {
            //add code to add a token from local storage ere.
        }

        let task = dataTask(with: endpoint.url)
        task.resume()
        return task
    }
}


//example usage of the code
func loadArticles(withId id: String, using session: URLSession = .shared) {
}
