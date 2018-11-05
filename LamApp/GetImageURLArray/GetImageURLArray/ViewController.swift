//
//  ViewController.swift
//  GetImageURLArray
//
//  Created by Ngo Mau Bao on 11/5/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Image"
        self.tableView.delegate = self as? UITableViewDelegate
        self.tableView.dataSource = self as? UITableViewDataSource
        
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

