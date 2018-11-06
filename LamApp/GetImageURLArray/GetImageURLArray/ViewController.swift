//
//  ViewController.swift
//  GetImageURLArray
//
//  Created by Ngo Mau Bao on 11/5/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var presenter : ImageCellProtocol?
    var name: NSArray = []
    var imageArr: NSArray = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name = ["tumblr_1","tumblr_2","tumblr_3","tumblr_4","tumblr_5","tumblr_6"]
        imageArr = [UIImage(named: "tumblr_1")!,UIImage(named: "tumblr_2")!,UIImage(named: "tumblr_3")!,UIImage(named: "tumblr_4")!,UIImage(named: "tumblr_5")!,UIImage(named: "tumblr_6")!]
        self.title = "Image"
        self.tableView.delegate = self as? UITableViewDelegate
        self.tableView.dataSource = self as? UITableViewDataSource
        
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        
        // async
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

