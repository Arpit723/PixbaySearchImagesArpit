//
//  PixbaySearch+SuggestionList.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 10/01/23.
//

import Foundation
import UIKit

//MARK: TableView DataSource
extension PixbaySearchViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("SuggesionListModel.shared.getSuggesionList().count \(SuggesionListModel.shared.getSuggesionList().count)")
        print("searchImagesArray.count \(searchImagesArray.count)")
        return isToShowSuggestionList ? SuggesionListModel.shared.getSuggesionList().count : searchImagesArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if isToShowSuggestionList {
            let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = SuggesionListModel.shared.getSuggesionList()[indexPath.row]
            return cell
        } else {
            guard let cell: ImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else {
                return UITableViewCell()
            }

            let searchItem = searchImagesArray[indexPath.row]
            cell.imageViewPixbayItem.showImageWithTheUseOfKingfisher(from: searchItem.userImageURL)
            cell.lblTags.text = searchItem.tags
            return cell
        }
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
        if isToShowSuggestionList {
            let searchText = SuggesionListModel.shared.getSuggesionList()[indexPath.item]
            viewModel.callGetSearchImagesAPI(for: searchText,
                                            page: currentPage)
        } else {
            let selectedItem = searchImagesArray[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "ImageDetailViewController") as? ImageDetailViewController else {
                print("vc not found")
                return
            }
            vc.selectedImageIndex = indexPath.row
            vc.searchImageArray = searchImagesArray
            UIApplication.getTopViewController()?.present(vc, animated: true)
            
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList) {
            print(#function)
            guard let searchText = searchController.searchBar.text,
                  searchText != "" else {
                print("Search text not found")
                return
            }
            self.isLoadingList = true
            loadMoreItemsForList(searchText: searchText)
            
    }
    
        func loadMoreItemsForList(searchText: String){
          currentPage += 1
          viewModel.callGetSearchImagesAPI(for:  searchText,
                                            page: currentPage)
        }
    }
    
    @objc func refresh() {
        print(#function)
        guard let searchText = searchController.searchBar.text,
              searchText != "" else {
            print("Search text not found")
            return
        }
        currentPage = 1
        viewModel.callGetSearchImagesAPI(for:  searchText,
                                          page: currentPage)
    }
}


