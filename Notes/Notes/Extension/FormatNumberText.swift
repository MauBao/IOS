//
//  FormatNumberText.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/17/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//
//let myInt = 1234500
//let myIntString = myInt.formattedWithSeparator  // "1 234 500"

import UIKit
    extension Formatter {
        static let withSeparator: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.groupingSeparator = " "
            formatter.numberStyle = .decimal
            return formatter
        }()
    }
    
    extension BinaryInteger {
        var formattedWithSeparator: String {
            return Formatter.withSeparator.string(for: self) ?? ""
        }
}
