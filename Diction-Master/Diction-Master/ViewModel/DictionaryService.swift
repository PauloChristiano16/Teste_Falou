//
//  DictionaryService.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import Foundation

struct WordDetailsResponse: Codable {
    let phonetics: [Phonetic]
    let meanings: [Meaning]
}

struct Phonetic: Codable {
    let audio: String?
}

struct Meaning: Codable {
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
}

class DictionaryService {
    func getWordDetails(word: String, completion: @escaping (Result<WordDetails, Error>) -> Void) {
        let urlString = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let wordDetailsResult = try decoder.decode([WordDetailsResponse].self, from: data)
                
                guard let firstWordDetailsResponse = wordDetailsResult.first else {
                    completion(.failure(NSError(domain: "No word details found", code: 0, userInfo: nil)))
                    return
                }
                
                let audioURL: URL? = firstWordDetailsResponse.phonetics.first?.audio.flatMap { URL(string: "https:\($0)") }
                
                let meaning = firstWordDetailsResponse.meanings.first?.definitions.first?.definition ?? "No definition found"
               
                let wordDetails = WordDetails(word: word, audioURL: audioURL, meaning: meaning)
                
                completion(.success(wordDetails))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}



