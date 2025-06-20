//
//  CharacterDTO.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation

struct CharacterResponseDTO: Codable {
    let data: CharactersDataDTO
}

struct CharactersDataDTO: Codable {
    let characters: CharacterResultDTO
}

struct CharacterResultDTO: Codable {
    let results: [CharacterDTO]
}

struct CharacterDTO: Codable {
    let id: String
    let name: String
    let status: String
    let origin: Planet
}
