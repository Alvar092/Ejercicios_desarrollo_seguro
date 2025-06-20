//
//  GraphQL.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation

struct GraphQLRequestBody: Codable {
    let query: String
    let variables: [String: String]?
}

