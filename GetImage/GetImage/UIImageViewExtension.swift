//
//  UIImageViewExtension.swift
//  GetImage
//
//  Created by Ngo Mau Bao on 11/2/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: .main, completionHandler: { (response, data, error) in
                
                if let imageData = data as Data? {
                    self.image = UIImage(data: imageData)
                }
            })
        }
    }
}

