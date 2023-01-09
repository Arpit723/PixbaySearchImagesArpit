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
        // Showing maximum lest say 10 suggestion list
        if suggestionListStrings.count > AppConstants.maxSuggestionListToShow {
            suggestionListStrings.removeLast()
        }
        UserDefaults.standard.set(suggestionListStrings,
                                  forKey: UserDefaultKeys.suggestionList)
    }
    
    public func getSuggesionList() -> [String] {
        let suggestionList = UserDefaults.standard.value(forKey: UserDefaultKeys.suggestionList) as? [String] ?? [String]()
        return suggestionList
    }
    
    
    
}
