//
//  PxbaySearchVC+Extension.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation
import UIKit

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
        viewModel.callGetSearchImagesAPI(for: searchText)
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

//MARK: Search Utility
extension PixbaySearchViewController {
    
    @objc func handleApiCalls(isCalledFromSearchButtonTapped: Bool = false) {
        guard let searchText = searchController.searchBar.text, searchText != "" else {
            print("No search text returns")
            return
        }
        viewModel.callGetSearchImagesAPI(for: searchText)
    }
    

}


extension PixbaySearchViewController {
    func bindSearchListViewModel() {
        print(#function)
        viewModel.showLoadingHud.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            guard let self = self else {
                print("Self not found")
                return
            }
            switch isLoading {
                case .loading:
                    print("loading")
                    self.indicatorView.startAnimating()
                case .success(let hits):
                    print("Success")
                    self.indicatorView.stopAnimating()
                    self.handleResults(hits: hits)
                case .failure(let errorMessage):
                    print("errorMessage \(errorMessage)")
                    self.indicatorView.stopAnimating()
                default:
                    print("default case")
            }
        }
    }
    func handleResults(hits: [Hit]) {
        if hits.count == 0 {
            self.searchImagesArray = [Hit]()
//            showAlert(message: MessageStrings.noImagesFound.rawValue)
        } else {
            self.searchImagesArray = hits
            SuggesionListModel.shared.addToSuggestionString(recentSearch: searchController.searchBar.text ?? "")
            isToShowSuggestionList = false
        }
        self.tableViewSearch.reloadData()
    }
}







