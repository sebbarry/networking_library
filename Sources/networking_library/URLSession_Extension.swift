//
//  File.swift
//  
//
//  Created by Sebastian Barry on 6/1/21.
//

import Foundation

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
        body: Data,
            then handler: @escaping (Result<Data, Error>) -> Void
        ) -> URLSessionDataTask {
            var request = URLRequest(
                url: endpoint.url,
                cachePolicy: .reloadIgnoringLocalCacheData
            )
        
            request.httpMethod = "POST"
            request.httpBody = body

            let task = dataTask(with: endpoint.url)
            task.resume()
            return task
        }
}


//example usage of the code
func loadArticles(withId id: String, using session: URLSession = .shared) {
    session.sendPostRequest(.recommendations, body: Data()) { result in
        <#code#>
    }
}
