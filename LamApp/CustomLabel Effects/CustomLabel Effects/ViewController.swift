//
//  ViewController.swift
//  CustomLabel Effects
//
//  Created by Ngo Mau Bao on 10/29/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOutLine: UILabel! {
        didSet {
            labelOutLine.makeOutLine(oulineColor: .red, foregroundColor: .white)
            labelOutLine.font = UIFont(name: labelOutLine.font.fontName, size: 30)
//            labelOutLine.font = labelOutLine.font.fontWithSize(50)
        }
    }
    
    @IBOutlet weak var labelUnderLine: UILabel! {
        didSet {
            labelUnderLine.text = "hehehehehehehehe ehehehehehehehehe"
            labelUnderLine.underline()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

