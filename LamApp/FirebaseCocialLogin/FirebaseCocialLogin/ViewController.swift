//
//  ViewController.swift
//  FirebaseCocialLogin
//
//  Created by Ngo Mau Bao on 10/25/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        
        // frame's are obselete, pllease use contraints instead because its 2018 after all
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 40)
        loginButton.delegate = self
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.readPermissions = ["email", "public_profile"]
        
        // add our cusstom fb login button here
        let customFBButton = UIButton()
        customFBButton.backgroundColor = .blue
        customFBButton.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 40)
        customFBButton.setTitle("Custom FB Login here", for: .normal)
        customFBButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(customFBButton)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        print("Successfully logged in with facebook...")
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err!)
                return
            }
            print(result as Any)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out off facebook")
    }
    
}

