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
    
    @IBOutlet weak var tableview: UITableView!
    
    var presenter : ImageCellProtocol?
    var imageList: [ImageModel]?

    var images: [String] = ["https://splashbase.s3.amazonaws.com/newoldstock/regular/tumblr_pfme9748DA1sfie3io1_1280.jpg",
                            "https://splashbase.s3.amazonaws.com/newoldstock/regular/tumblr_ph3sduP91I1sfie3io1_1280.jpg",
                            "https://splashbase.s3.amazonaws.com/newoldstock/regular/tumblr_ph3sdrq3UK1sfie3io1_1280.jpg",
                            "https://splashbase.s3.amazonaws.com/newoldstock/regular/tumblr_ph8vg6OMLo1sfie3io1_1280.jpg",
                            "https://splashbase.s3.amazonaws.com/mazwai/regular/776180221.png%3F1507542855",
                            "https://splashbase.s3.amazonaws.com/newoldstock/regular/tumblr_ph8vg9TXSq1sfie3io1_1280.jpg",
                            "https://splashbase.s3.amazonaws.com/newoldstock/regular/tumblr_ph8vgdJV2r1sfie3io1_1280.jpg",
                            "https://splashbase.s3.amazonaws.com/mazwai/regular/the_sea_also_rises_FKY.png%3F1506949636",
                            "https://splashbase.s3.amazonaws.com/mazwai/regular/travelpockets_iceland_land_of_fire_and_ice.png%3F1528191920",
                            "https://splashbase.s3.amazonaws.com/mazwai/regular/omote_iceland__an_iceland_venture.png%3F1528050680"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Image"
        self.tableView.delegate = self as? UITableViewDelegate
        self.tableView.dataSource = self as? UITableViewDataSource
        
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        
        // async
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetchImage { (images) in
                self.imageList = images
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
    }
    
    func fetchImage(completion: @escaping ([ImageModel]) -> ()) {
        for i in images {
            let urlSring = i
            guard let url = URL(string: urlSring) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                do {
                    guard let data = data else { return }
                    let dataArray = try decoder.decode([ImageModel].self, from: data)
                    DispatchQueue.main.async {
                        completion(dataArray)
                    }
                } catch {
                    print(error)
                }
                }.resume()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

