//
//  ViewController.swift
//  GetImage
//
//  Created by Ngo Mau Bao on 11/2/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var images: [ImageModel]?
    var presenter: ImageCellProtocol?
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Image"
        
        self.tableview.delegate = self as? UITableViewDelegate
        self.tableview.dataSource = self as? UITableViewDataSource
        
         tableview.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        
        // async
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetchImage { (images) in
                self.images = images
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchImage(completion: @escaping ([ImageModel]) -> ()) {
//        let urlSring = "http://www.splashbase.co/api/v1/images/latest"
        let urlSring = "https://jsonplaceholder.typicode.com/photos"
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

