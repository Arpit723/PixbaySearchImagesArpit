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

//MARK: Search bar and suggsion list
extension PixbaySearchViewController: UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
        showSuggestionsList()
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        handleApiCalls(isCalledFromSearchButtonTapped: true)
    }
    
    func showSuggesionList() {
        print("isToShowSuggestionList \(isToShowSuggestionList)")
        isToShowSuggestionList = true
        tableViewSearch.reloadData()
    }
}


//MARK: Search Utility
extension PixbaySearchViewController {
    
    @objc func handleApiCalls(isCalledFromSearchButtonTapped: Bool = false) {
        guard let searchText = searchController.searchBar.text, searchText != "" else {
            print("No search text returns")
            showSuggestionsList()
            return
        }
        viewModel.callGetSearchImagesAPI(for: searchText,
                    isCalledFromSearchButtonTapped: isCalledFromSearchButtonTapped)
    }
    
    
    func showSuggestionsList() {
        
    }
    
}
