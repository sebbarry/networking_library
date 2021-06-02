//
//  File.swift
//  
//
//  Created by Sebastian Barry on 6/1/21.
//

import Foundation

/*
 This is simply a mock data model
 */
struct User:Codable
{
    var id: String
    var firstName: String
    var lastName: String
    var country: String

    init(id: String, firstName: String, lastName: String, country: String){
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.country = country
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case country
    }
}
