//
//  PxbaySearchVC+Extension.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation
import UIKit

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
                case .success(let users):
                    print("Success")
                    self.indicatorView.stopAnimating()
                    self.searchImagesArray = users
                    self.tableViewSearch.reloadData()
                case .failure(let errorMessage):
                    print("errorMessage \(errorMessage)")
                    self.indicatorView.stopAnimating()
                default:
                    print("default case")
            }
        }
    }
}

//MARK: - Search Resule updations
extension PixbaySearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {

    }

}


//MARK: TableView DataSource
extension PixbaySearchViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchImagesArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else {
            return UITableViewCell()
        }
        
        let searchItem = searchImagesArray[indexPath.row]
        cell.imageViewPixbayItem.showImageWithTheUseOfKingfisher(from: searchItem.userImageURL)
        cell.lblTags.text = searchItem.tags
        return cell
    }

}

//MARK: TableView Delegate
extension PixbaySearchViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


//MARK: Utility
extension PixbaySearchViewController {
    
    
    
    
}