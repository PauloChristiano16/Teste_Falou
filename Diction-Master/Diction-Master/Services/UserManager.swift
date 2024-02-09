//
//  UserManager.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import Foundation

class UserManager {
    private var searchCount: Int = 0
    private let maxSearchLimit: Int = 5
    
    func incrementSearchCount() {
        searchCount += 1
    }
    
    func canMakeSearch() -> Bool {
        return searchCount < maxSearchLimit
    }
}

