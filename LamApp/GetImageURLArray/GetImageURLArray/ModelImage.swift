//
//  ModelImage.swift
//  GetImageURLArray
//
//  Created by Ngo Mau Bao on 11/5/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

struct ImageModel: Decodable {

    var thumbnailUrl: String?
    
    init(dictionary: [String:String]) {
        self.thumbnailUrl = dictionary["thumbnailUrl"] ?? ""
    }
}
