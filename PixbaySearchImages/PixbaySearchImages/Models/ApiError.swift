//
//  ApiError.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation

enum ApiError: Error, LocalizedError {
    case decodingError
    case serverError
    var errorDescription: String? {
        switch self {
            case .decodingError:
                return "Error in decoding value"
            case .serverError:
                return "Server Error"
        }
    }
}
