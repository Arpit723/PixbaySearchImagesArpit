//
//  ImageView+extension.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func showImageWithTheUseOfKingfisher(from urlString: String) {
        
        guard let url = URL(string: urlString) else {
            print("Bad url")
            return
        }
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "wrench.and.screwdriver"),
            options: [
                .processor(processor),
                .loadDiskFileSynchronously,
                .cacheOriginalImage,
                .transition(.fade(0.25))
            ],
            progressBlock: { receivedSize, totalSize in
                // Progress updated
            },
            completionHandler: { result in
                // Done
            }
        )
    }
}
