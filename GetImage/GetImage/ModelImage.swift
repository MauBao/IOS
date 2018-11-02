//
//  ModelImage.swift
//  GetImage
//
//  Created by Ngo Mau Bao on 11/2/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

//struct ImageModel: Decodable {
//    var id: Int?
//    var url: String?
//    var large_url: String?
//    var source: String?
//
//}

struct ImageModel: Decodable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
