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




//MARK: TableView DataSource
extension PixbaySearchViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SuggesionListModel.shared.getSuggesionList().count 
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if isToShowSuggestionList {
            let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = SuggesionListModel.shared.getSuggesionList()[indexPath.row]
            return cell
//        } else {
//            guard let cell: ImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else {
//                return UITableViewCell()
//            }
//
//            let searchItem = searchImagesArray[indexPath.row]
//            cell.imageViewPixbayItem.showImageWithTheUseOfKingfisher(from: searchItem.userImageURL)
//            cell.lblTags.text = searchItem.tags
//            return cell
//        }
    }

}

//MARK: TableView Delegate
extension PixbaySearchViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isToShowSuggestionList {
            return 50.0
        } else {
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


//MARK: Utility
extension PixbaySearchViewController {
    
    
    
    
}
