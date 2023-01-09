//
//  UserListViewModel.swift
//  UserAppArpit
//
//  Created by Ravi Chokshi on 08/01/23.
//

import Foundation


// MARK: API Call
class SearchImagesViewModel {
    
    let showLoadingHud: Observable<SearchAPIStatus> = Observable(.noStatus)
    func callGetSearchImagesAPI(for searchString: String) {
        self.showLoadingHud.value = .loading
        let searchKeywords = getSearchKeywords(from: searchString)
        WebSerice.getDataApiCall(searchKeywords: searchKeywords, completion: { result in
            switch result {
                case .success(let responseData):
                    self.showLoadingHud.value = .success(data: responseData.hits)
                case .failure(let error):
                    self.showLoadingHud.value = .failure(errorStr: error.errorDescription ?? "")
            }
        })
    }
}

//MARK: Search Utility
extension SearchImagesViewModel {
    
    private func getSearchKeywords(from searchString: String) -> String  {
        let keyowrdsArray =  searchString.components(separatedBy: " ")
        let searchKeywords = keyowrdsArray.joined(separator: "+")
        print("searchString \(searchKeywords)")
        return searchKeywords
    }
    
}
