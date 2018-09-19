//: Playground - noun: a place where people can play

import UIKit
/*Dictionary :
 var Tên:[Kiểu dữ liệu của Key:Kiểu dữ liệu của Value] =[tên key : giá trị]
 Truy xuất: tên[key]
 Xoá phần tử theo key: tên.removeValueForKey[“tên key cần xoá];
 */

var Dict:[String:Int] = ["1":1]
var Dict1:[String:Int] = [:]
Dict["1"]
Dict["1"]=8
Dict["2"]=10
Dict.removeValue(forKey: "1")

/*
 Đối với Tuples kiểu mới:
 var tên=(value1, value2, value3)
 */
var hocsinh = (
    1,
    ten: "Khoa",
    tuoi: 16,
    "Nu",
    diem: [10, 8, 9, 6],
    (diemtb: ["HK1": 7, "HK2": 9]),
    xeploai: "Gioi",
    gvcn: ["Linh", "Hung"]
)
//Đối với có key truy xuất qua key hoặc vị trí:
hocsinh.ten
hocsinh.0

//Dối với values chỉ truy xuất thông qua vị trí chỉ số:
hocsinh.0
hocsinh.3
