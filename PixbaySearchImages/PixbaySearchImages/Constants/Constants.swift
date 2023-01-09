//
//  Constants.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation

struct AppConstants {
    static let PixbaySearchAPIKey = "32719220-a257020a510d0cff7169a6471"
    static let AppName = "PixbaySearch"
    static let maxSuggestionListToShow = 10
}

enum MessageStrings: String {
     case  noImagesFound = "Sorry, No images found for your search."
}

struct UserDefaultKeys {
    static let suggestionList = "SuggestionList"
}
