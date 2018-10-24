//
//  ViewController.swift
//  Firebase-Notification-Example
//
//  Created by Bao Ngo Mau on 10/22/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

class ViewController: UIViewController {

    var ref: DatabaseReference!
    ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

