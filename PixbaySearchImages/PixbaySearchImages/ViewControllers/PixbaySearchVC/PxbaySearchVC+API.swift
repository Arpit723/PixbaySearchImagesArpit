//
//  PxbaySearchVC+Extension.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation
import UIKit



//MARK: Search Utility
extension PixbaySearchViewController {
    
//    @objc func handleApiCalls(isCalledFromSearchButtonTapped: Bool = false) {
//        guard let searchText = searchController.searchBar.text, searchText != "" else {
//            print("No search text returns")
//            return
//        }
//        viewModel.callGetSearchImagesAPI(for: searchText)
//    }
//

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
                if (self.tableViewSearch.refreshControl?.isRefreshing ?? false) == false {
                    self.indicatorView.startAnimating()
                }
                case .success(let hits):
                    print("Success")
                    self.indicatorView.stopAnimating()
                    self.handleResults(hits: hits)
                    self.refreshControl?.endRefreshing()
                case .failure(let errorMessage):
                    print("errorMessage \(errorMessage)")
                    self.indicatorView.stopAnimating()
                    self.refreshControl?.endRefreshing()
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
            if currentPage == 1 {
                self.searchImagesArray = hits
            }
            else {
                self.searchImagesArray.append(contentsOf: hits)
            }
            SuggesionListModel.shared.addToSuggestionString(recentSearch: searchController.searchBar.text ?? "")
            isToShowSuggestionList = false
        }
        searchController.searchBar.resignFirstResponder()
        isLoadingList = false
        self.tableViewSearch.reloadData()
    }
}







