//
//  ExpenseTableViewCell.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/18/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMonthMoney: UILabel!
    @IBOutlet weak var lblMoney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
