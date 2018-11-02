//
//  ImageViewExtension.swift
//  GetImage
//
//  Created by Ngo Mau Bao on 11/2/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let images = self.images {
            return images.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        
        if let images = self.images {
            cell.img = images[indexPath.item]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
