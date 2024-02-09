//
//  SearchViewModel.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 08/02/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    private let dictionaryService = DictionaryService()
    private let cacheManager = CacheManager()
    
    @Published var wordDefinition: WordDefinition?
    
    func searchWord(word: String) {
        if let cachedDefinition = cacheManager.getWordDefinition(word: word) {
            self.wordDefinition = cachedDefinition
            return
        }
        
        dictionaryService.fetchWordDefinition(word: word) { [weak self] definition in
            guard let self = self, let definition = definition else { return }
            self.cacheManager.saveWordDefinition(word: word, definition: definition)
            self.wordDefinition = definition
        }
    }
}
