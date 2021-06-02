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
    func request(
        _ endpoint: Endpoint,
        then handler: @escaping Handler
    ) -> URLSessionDataTask {
        let task = dataTask(with: endpoint.url, completionHandler: handler)
        task.resume()
        return task
    }
}


func loadArticles(withId id: String, using session: URLSession = .shared) {
    session.request(.recommendations) { (data, response, error) in
        <#code#>
    }
}
