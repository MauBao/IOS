//
//  ViewController.swift
//  3DTouch
//
//  Created by Ngo Mau Bao on 10/24/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Hien thi % luc cham vao
//        if let touch = touches.first {
//            if #available(iOS 9.0, *) {
//                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
//                    // 3D Touch capable
//                    let force = touch.force/touch.maximumPossibleForce
//                    forceLabel.text = "\(force)% force"
//                }
//            }
//        }
        
        // Hien thi gram. Can k đc quá 385gram
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        forceLabel.text = "385+ grams"
                    } else {
                        let force = touch.force/touch.maximumPossibleForce
                        let grams = force * 385
                        let roundGrams = Int(grams)
                        forceLabel.text = "\(roundGrams) grams"
                    }
                }
            }
        }
    }
   
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        forceLabel.text = "0 gram"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

