//
//  CustomNoteTableViewCell.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/12/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

protocol NoteCellProtocol {
    
}

class CustomNoteTableViewCell: UITableViewCell {

    var delegate: NoteCellProtocol?
    
    @IBOutlet weak var lblNameNote: UILabel!
    @IBOutlet weak var lblMoneyNote: UILabel!
    @IBOutlet weak var lblNotes: UILabel!
    @IBOutlet weak var lblDateCreateNote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
