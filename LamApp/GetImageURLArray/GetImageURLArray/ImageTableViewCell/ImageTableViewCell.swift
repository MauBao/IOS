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
