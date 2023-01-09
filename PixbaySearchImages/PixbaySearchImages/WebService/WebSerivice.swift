////
////  WebSerivice.swift
////  UserAppArpit
////
////  Created by Ravi Chokshi on 08/01/23.
////
//
import Foundation
import UIKit

//extension UserListViewModel {
//    enum UserAPIStatus {
//        case loading
//        case success(data: [UserModel])
//        case failure(errorStr: String)
//        case noStatus
//    }
//}

class WebSerice {

    static func getDataApiCall(completion:
                               @escaping (Result<SearchResponseModel, ApiError>) -> Void) {
        let url = URL(string: "https://pixabay.com/api/?key=\(AppConstants.PixbaySearchAPIKey)&q=a&image_type=photo")!

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode(SearchResponseModel.self,
                                                                            from: data) {
                        print(response)
                        print("Parse completed")
                        completion(.success(response))
                    } else {
                        print("Can not parse")
                        completion(.failure(.decodingError))
                    }
                }
                else {
                    completion(.failure(.serverError))
                }
        }
        task.resume()
    }
}
