//
//  Vertex.swift
//  MetalTutorial
//
//  Created by Ngo Mau Bao on 10/31/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//
// save vi tri mau sac moi dinh

struct  Vertex {
    
    var x, y, z: Float      // dữ liệu vị trí
    var r, g, b, a: Float    // color data
    
    func  floatBuffer () -> [ Float ] {
        return [x, y, z, r, g, b, a]
    }
    
}
