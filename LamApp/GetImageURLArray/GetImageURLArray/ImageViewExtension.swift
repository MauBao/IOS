//
//  ImageViewExtension.swift
//  GetImageURLArray
//
//  Created by Ngo Mau Bao on 11/5/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        // async
        DispatchQueue.global(qos: .userInteractive).async {
            cell.ImageTableCell.image = self.imageArr[indexPath.row] as? UIImage
            DispatchQueue.main.async {
                cell.lblTableCell.text! = self.name[indexPath.row] as! String
            }
        }
        return cell
    }

}

