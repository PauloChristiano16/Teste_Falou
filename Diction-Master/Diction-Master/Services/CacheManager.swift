//
//  CacheManager.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import Foundation

class CacheManager {
    private var cachedWords: Set<String> = Set()
    
    func addWordToCache(_ word: String) {
        cachedWords.insert(word)
    }
    
    func isWordCached(_ word: String) -> Bool {
        return cachedWords.contains(word)
    }
}

