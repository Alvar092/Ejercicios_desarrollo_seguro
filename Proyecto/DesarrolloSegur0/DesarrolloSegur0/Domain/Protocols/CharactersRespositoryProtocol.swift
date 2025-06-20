//
//  CharactersRespositoryProtocol.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation

protocol CharactersRespositoryProtocol {
    
    func getCharactersMapped(filter: String) async -> [CharacterModel]
}

