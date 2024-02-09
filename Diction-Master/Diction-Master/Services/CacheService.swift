//
//  CacheService.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import Foundation

class CacheService {
    private var cache = NSCache<NSString, NSArray>()
    
    func getCachedDefinitions(for word: String) -> [WordDefinition]? {
        if let cachedVersion = cache.object(forKey: word as NSString) as? [WordDefinition] {
            return cachedVersion
        }
        return nil
    }
    
    func cacheDefinitions(_ definitions: [WordDefinition], for word: String) {
        cache.setObject(definitions as NSArray, forKey: word as NSString)
    }
}

