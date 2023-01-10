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




/*
  #Suggestion List
    1. SearchBar - Focus - Show suggestion List
    2. Search Button Click: Pass
    3. API Calls - Hide suggestion List
    4. Search Bar - cancel button click - Hide suggestion List - Not to show any search results
  */
//MARK: Search Bar
extension PixbaySearchViewController: UISearchBarDelegate {
    
    // #Suggestion List: Focus textfield - Show suggestion List
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function,"#1.Suggestion List: Focus textfield - Show suggestion List")
        showSuggesionList()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
//        handleApiCalls(isCalledFromSearchButtonTapped: true)
        guard let searchText = searchController.searchBar.text, searchText != "" else {
            print("searchText not found")
            return
        }
        currentPage = 1
        viewModel.callGetSearchImagesAPI(for: searchText,
                                        page: currentPage)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        //Hide show suggestin List
        isToShowSuggestionList = false
        searchImagesArray = [Hit]()
        tableViewSearch.reloadData()
    }
    func showSuggesionList() {
        print("#showSuggesionList, #2. SearhcBarFocus")
        isToShowSuggestionList = true
        tableViewSearch.reloadData()
    }
}
