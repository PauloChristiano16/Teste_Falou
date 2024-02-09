//
//  DictionaryViewModel.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import Foundation

class DictionaryViewModel: ObservableObject {
    private let dictionaryService = DictionaryService()
    private let cacheManager = CacheManager()
    private let userManager = UserManager()
    
    @Published var wordDetails: WordDetails?
    @Published var errorMessage: String?
    
    func searchWord(_ word: String) {
        if userManager.canMakeSearch() {
            if !cacheManager.isWordCached(word) {
                dictionaryService.getWordDetails(word: word) { [weak self] result in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let wordDetails):
                            self.wordDetails = wordDetails
                            self.cacheManager.addWordToCache(word)
                            self.userManager.incrementSearchCount()
                        case .failure(let error):
                            self.errorMessage = "Error fetching word details: \(error.localizedDescription)"
                        }
                    }
                }
            } else {
                print("Word details retrieved from cache for '\(word)'")
                userManager.incrementSearchCount()
            }
        } else {
            DispatchQueue.main.async {
                self.errorMessage = "Limit of searches reached. Please purchase to continue."
            }
        }
    }
}

