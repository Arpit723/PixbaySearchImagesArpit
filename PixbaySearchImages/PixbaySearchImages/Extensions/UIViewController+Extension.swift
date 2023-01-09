//
//  UIViewController+Extension.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation
import UIKit

extension UIViewController {
    

    func showAlert(message: String) {
        let alert = UIAlertController(title: AppConstants.AppName, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

