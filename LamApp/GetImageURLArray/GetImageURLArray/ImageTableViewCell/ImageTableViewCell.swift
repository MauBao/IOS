//
//  ImageTableViewCell.swift
//  GetImageURLArray
//
//  Created by Ngo Mau Bao on 11/5/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit

protocol ImageCellProtocol {
    
}

class ImageTableViewCell: UITableViewCell {

    var img: ImageModel? {
        didSet {
            guard let img = img else { return }
            guard let thumbnailString = img.thumbnailUrl else { return }
            
//            cellLabel.text = img.title
            if let thumbnailUrl = URL(string: thumbnailString) {
                let data = try! Data(contentsOf: thumbnailUrl)
                ImageTableCell.image = UIImage(data: data)
            }
        }
    }
    
    @IBOutlet weak var ImageTableCell: UIImageView!
    @IBOutlet weak var lblTableCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
