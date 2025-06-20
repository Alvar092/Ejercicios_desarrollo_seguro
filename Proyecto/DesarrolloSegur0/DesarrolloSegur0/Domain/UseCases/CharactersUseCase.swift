//
//  CharactersUseCase.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation

protocol CharactersUseCaseProtocol {
    var repo: CharactersRespositoryProtocol {get set}
    
    func getCharacters(filter: String) async -> [CharacterModel]
}

final class CharactersUseCase: CharactersUseCaseProtocol {
    var repo: CharactersRespositoryProtocol
    
    init(repo: CharactersRespositoryProtocol = CharactersRepository(network: NetworkCharacters())) {
        self.repo = repo
    }
    
    func getCharacters(filter: String) async -> [CharacterModel] {
        return await repo.getCharactersMapped(filter: filter)
    }
}
