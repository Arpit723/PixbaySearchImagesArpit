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
    func getUserData() {
        self.showLoadingHud.value = .loading
        WebSerice.getDataApiCall(completion: { result in
            switch result {
                case .success(let responseData):
                    self.showLoadingHud.value = .success(data: responseData.hits)
                case .failure(let error):
                    self.showLoadingHud.value = .failure(errorStr: error.errorDescription ?? "")
            }
        })
    }
}
