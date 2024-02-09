//
//  WordDefinition.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 08/02/24.
//

import Foundation

// Modelo para definir a resposta da API
struct WordDefinition: Codable, Identifiable {
    var id: String { word }
    let word: String
    let phonetics: [Phonetic]
    let meanings: [Meaning]
}

struct Phonetic: Codable {
    let text: String?
    let audio: String?
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
    let example: String?
}


