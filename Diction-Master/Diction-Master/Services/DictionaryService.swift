//
//  DictionaryService.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 08/02/24.
//

import Foundation

class DictionaryService {
    func fetchWordDefinition(word: String, completion: @escaping (WordDefinition?) -> Void) {
        let urlString = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let wordDefinition = try? JSONDecoder().decode([WordDefinition].self, from: data).first
            DispatchQueue.main.async {
                completion(wordDefinition)
            }
        }
        
        task.resume()
    }
}

