//
//  SuggestionListModel.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation


struct SuggesionListModel {
    
    static var shared = SuggesionListModel()
    private init() {
        print("Init only once")
    }
    
    private var suggestionListStrings = [String]()
    
    public mutating func addToSuggestionString(recentSearch: String) {
        suggestionListStrings.insert(recentSearch,
                                     at: 0)
    }
    
    public func getSuggesionList() -> [String] {
        return suggestionListStrings
    }
    
}
