//
//  ViewController.swift
//  Demo
//
//  Created by Bao Ngo Mau on 9/12/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var LabelClick: UILabel!
    @IBAction func btnClick(_ sender: Any) {
        LabelClick.text = "abgsvgjkgt djfrsjnfg gjnmgh ijngaefjgiaoserogvbar"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo App"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

