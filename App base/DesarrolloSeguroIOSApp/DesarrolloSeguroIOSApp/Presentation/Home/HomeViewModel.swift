//
//  HomeViewModel.swift
//  DesarrolloSeguroIOSApp
//
//  Created by Ismael Sabri Pérez on 21/2/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // MARK: Properties
    let repository: RepositoryProtocol
    @Published var heroes: [Hero] = []
    
    // MARK: Init
    init(repository: RepositoryProtocol) {
        self.repository = repository
        fetchHeroes()
    }

    // MARK: Functions
    func fetchHeroes() {
        DispatchQueue.main.async {
            Task {
                guard let heroes = try? await self.repository.heroes(name: "") else {
                    print("Error while fetching the heroes: the heroes are nil or the request failed")
                    return
                }
                self.heroes = heroes
            }
        }
    }
    
    func fetchTransformations(heroID: String) {
        DispatchQueue.main.async {
            Task {
                guard let transformations = try? await self.repository.transformations(heroID: heroID) else {
                    print("Error while fetching the transformations. They are nil or the request failed")
                    return
                }
                if !transformations.isEmpty{
                    print("Transformations for hero with ID \(heroID) : \(transformations)")
                }
            }
        }
    }
}
