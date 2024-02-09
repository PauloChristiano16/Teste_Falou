//
//  APIService.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import Foundation

class APIService {
    func fetchWordDefinition(word: String, completion: @escaping (Result<[WordDefinition], Error>) -> Void) {
        let urlString = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let definitions = try JSONDecoder().decode([WordDefinition].self, from: data)
                completion(.success(definitions))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

