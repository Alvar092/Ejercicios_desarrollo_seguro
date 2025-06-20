//
//  Hero.swift
//  DesarrolloSeguroIOSApp
//
//  Created by Ismael Sabri Pérez on 16/2/24.
//

import Foundation

struct Hero: Identifiable, Decodable {
    let photo: String
    let id: String
    let name: String
    let description: String
}

struct Transformation: Identifiable, Codable {
    let photo: String
    let description: String
    let id: String
    let name: String
}

