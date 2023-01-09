//
//  PixbaySearchVC+HandleSearch.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation
import UIKit

//MARK: - Search Resule updations
extension PixbaySearchViewController: UISearchResultsUpdating {
    
    // This method will call, when user is typing in search bar
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
//        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(handleApiCalls), object: nil)
//        self.perform(#selector(handleApiCalls), with: nil, afterDelay: 1.0)
//        
    }
    
}




