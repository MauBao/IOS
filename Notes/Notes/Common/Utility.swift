//
//  Utility.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/15/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class Utility {
    class func showAlert(message: String, context: UIViewController) {
        // create the alert
        let alert = UIAlertController(title: Constants.titleShowAlertMessage, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: Constants.buttonShowAlertOK, style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        context.present(alert, animated: true, completion: nil)
    }
}
