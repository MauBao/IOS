//
//  ExtensionUILabel.swift
//  CustomLabel Effects
//
//  Created by Ngo Mau Bao on 10/29/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit

extension UILabel {
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
        NSAttributedStringKey.strokeColor : oulineColor,
        NSAttributedStringKey.foregroundColor : foregroundColor,
        NSAttributedStringKey.strokeWidth : -4.0,
        NSAttributedStringKey.font : self.font
        ] as [NSAttributedStringKey : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
                attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}