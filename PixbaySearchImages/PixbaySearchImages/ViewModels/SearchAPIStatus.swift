//
//  SearchAPIStatus.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation

extension SearchImagesViewModel {
    enum SearchAPIStatus {
        case loading
        case success(data: [Hit])
        case failure(errorStr: String)
        case noStatus
    }
}
