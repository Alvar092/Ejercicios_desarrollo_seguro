//
//  NetworkLogin.swift
//  DesarrolloSegur0
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import Foundation

protocol NetworkCharactersProtocol {
    func getCharacters(filter: String) async -> CharacterResponseDTO?
}


final class NetworkCharacters: NetworkCharactersProtocol {
    func getCharacters(filter: String) async -> CharacterResponseDTO? {
        var modelReturn: CharacterResponseDTO? = nil
        
        let url: String = "\(ConstantsApp.API_URL)"
        
        var request: URLRequest = URLRequest(url:URL(string: url)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
        
        let query = """
        query ($name: String!) {
          characters(filter: { name: $name }) {
            results {
              id
              name
              status
              image
            }
          }
        }
        """
        
        let requestBody = GraphQLRequestBody(
            query: query,
            variables: ["filter": filter]
        )
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            print("Error al codificar el cuerpo de la petición: \(error)")
        }
       
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HTTPResponseCodes.SUCCESS {
                    modelReturn = try! JSONDecoder().decode(CharacterResponseDTO.self, from: data)
                }
            }
        } catch {
            print("Error al hacer la petición o decodificar la respuesta: \(error)")
        }
        
        return modelReturn
    }
    
    
}
