//
//  ViewController.swift
//  UnitTest
//
//  Created by Bao Ngo Mau on 10/5/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumTextField: UITextField!
    @IBOutlet weak var secondNumTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func onButtonClicked(_ sender: Any) {
        
        let number1 = firstNumTextField.text!
        let number2 = secondNumTextField.text!
        if number1.characters.count == 0 || number2.characters.count == 0 {
            return
        }
        
        let result = multiply(num1: Double(number1)!, num2: Double(number2)!)
        
        showResult(result: "\(result)")
        
    }
    
    func multiply(num1: Double, num2: Double) -> Double {
        return (num1 + num2)
    }
    
    func showResult(result: String) {
        resultLabel.text = result
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

