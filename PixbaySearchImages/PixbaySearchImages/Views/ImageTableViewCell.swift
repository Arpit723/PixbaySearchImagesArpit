//
//  ImageTableViewCell.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTags: UILabel!
    @IBOutlet weak var imageViewPixbayItem: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
