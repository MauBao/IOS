//: Playground - noun: a place where people can play

import UIKit


/*Đối với Array:
 Khai báo: var Tên mảng: [kiểu dữ liệu mảng] = [giá trị1, giá trị2,giá trị3]
 Truy Xuất: Tên Mảng[Chỉ số]
 Update: Tên Mảng[chỉ số]=giá trị mới.
 Add: Tên Mảng += [Giá trị]
 Delete: Tên Mảng.removeAtIndex(vị trí xoá)
 */
//Mang Int
var Array: [Int] = [3,2,87,1,6,4,9]
//Mang truyen vao tuy kieu du lieu
var ArrayAnyObject: [AnyObject] = [1 as AnyObject,"2" as AnyObject,4 as AnyObject]
//Khai bao mang null
var Arr:[Int] = []
// truy van
var count = Array.count
print(Array[1...4])
print(Array[1..<3])
//insert last
Array += [10]
//Update
Array[0] = 3
//delete ptu mang
Array.remove(at: Array.count - 1)

