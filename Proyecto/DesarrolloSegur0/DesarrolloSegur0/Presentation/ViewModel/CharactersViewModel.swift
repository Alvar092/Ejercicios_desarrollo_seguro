//
//  CharactersViewModel.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation
import Combine

final class CharactersViewModel: ObservableObject {
    // Lista de personajes
    @Published var characters = [CharacterModel]()
    
    var suscriptors = Set<AnyCancellable>()
    private var useCase: CharactersUseCaseProtocol
    
    init(useCase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.useCase = useCase
        Task {
            await loadCharacters()
        }
    }
    
    func loadCharacters() async {
        let data = await useCase.getCharacters(filter: "")
        
        DispatchQueue.main.async {
            self.characters = data
        }
    }
}
