//
//  CharacterModel.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation

struct CharacterModel: Codable {
    let id: String 
    let name: String
    let status: String
    let origin: Planet
}

struct Planet: Codable {
    let name: String
}
