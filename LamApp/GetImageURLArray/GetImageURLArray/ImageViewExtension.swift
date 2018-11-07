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
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        // set up activity indicator
        activityIndicator.center = CGPoint(x: cell.ImageTableCell.bounds.size.width/2, y: cell.ImageTableCell.bounds.size.height/2)
        activityIndicator.color = UIColor.yellow
        cell.ImageTableCell.addSubview(activityIndicator)
        
        // async
        DispatchQueue.global(qos: .userInteractive).async {
            activityIndicator.startAnimating()

            cell.ImageTableCell.image = self.imageArr[indexPath.row] as? UIImage
            
            activityIndicator.stopAnimating()

            DispatchQueue.main.async {
                cell.lblTableCell.text! = self.name[indexPath.row] as! String
            }
        }
        return cell
    }
    
//    spinner loading cuoi cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            // print("this is the last cell")
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
        }
    }
}

