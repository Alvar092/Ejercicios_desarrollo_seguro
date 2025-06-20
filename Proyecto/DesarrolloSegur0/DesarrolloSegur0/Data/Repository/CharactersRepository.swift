//
//  CharactersRepository.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation

final class CharactersRepository: CharactersRespositoryProtocol {
    
    private var network: NetworkCharactersProtocol
    
    init(network: NetworkCharactersProtocol) {
        self.network = network
    }
    
    func getCharactersMapped(filter: String) async -> [CharacterModel] {
        
        guard let response = await network.getCharacters(filter: filter) else { return [] }
        
        let characters = response.data.characters.results.map { result in
            CharacterModel(
                id: result.id,
                name: result.name,
                status: result.status,
                origin: result.origin
            )
        }
        return characters
    }
}
