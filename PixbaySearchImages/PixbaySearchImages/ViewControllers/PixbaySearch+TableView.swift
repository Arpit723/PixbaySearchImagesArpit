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
        
    }
}
