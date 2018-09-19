//: Playground - noun: a place where people can play

import Foundation
//
//let hello: (String) -> Void = { fullName in
//    print("Xin chào \(fullName)")
//}
//hello("MauBao") //"Xin chào MauBao"
//
////[1,3,5,8,25,67,89]
//
//// Declare a variable to hold a closure
//var add: (Int, Int) -> Int
//
//// Assign a closure to a variable
//add = { (a: Int, b: Int) -> Int in
//    return a + b
//}
//
//// Or combine like this
//var sub = { (a: Int, b: Int) -> Int in
//    return a - b
//}
//
//add(1, 2)
//sub(1, 2)
//
///* SHORTHAND SYNTAX */
//
//// Not need return keyword when only have single return statement
//add = {(a: Int, b: Int) -> Int in
//    a + b
//}
//add(1, 1)
//
//// Remove return type and parameters type
//// Because we already declare: var add: (Int, Int) -> Int
//add = {(a, b) in
//    a + b
//}
//
//add(9, 2)
//
//// Remove parameters, Swift will refer parameters by number, start from 0:
//add = {
//    $0 + $1
//}
//
//add(99, 1)
//
//
////Các ứng dụng của Clouse nên biết
////sorted(): dùng để thay đổi điều kiện sort cho array/collection…
//let ages: [Int] = [1,3,5,67,25,88,89]
//var sortedAges = ages.sorted()
//// Using custom clouse to changer soft order
//sortedAges = ages.sorted() {
//    $0 > $1
//}
//
////filter(): dùng dể lọc các phần tử của collection/array với điều kiện nhất định
//let menberAges: [Int] = [3,4,8,25,16,21,15,28]
//let adulst = menberAges.filter {
//    $0 > 20
//}
//
////map(): dùng để áp dụng điều kiện nào đó cho tất cả các item trong array/collection
////note 10_000 = 10000
//let carSalePrices = [10000, 34000, 20_000, 450000, 100000]
//let carPricesInVietNam = carSalePrices.map {
//    $0 * 200/100
//}
////reduce(): dùng để tính tổng của array
//let book: [(String, Int, Double)] = [("A",12,39_000),
//                                     ("B",9,22_000),
//                                     ("C",4,9_000),
//                                     ("F",5,56_000)]
////Using reduce to calculate total prices of all books
//let sumPrice = book.reduce(0) {
//    //    Init value (0) or current value + (number of book * price of each book)
//    $0 + Double($1.1) * $1.2
//}
///*Step1. $0 sẽ có giá trị là 0 (chính là giá trị của init result). $1 là object đầu tiên của array books. Closure này sẽ return kết quả là $0 (=0)+ (12  39.000) =468.000 . Kết quả này sẽ được gán cho $0 của step tiếp theo. Nếu truyền vào giá trị ban đầu là số khác, thì $0 cũng tương đương với giá trị của số đó. Ví dụ ở trên, nếu truyền vào là books.reduce(5)… thì closure sẽ return kết quả là $0 (=5)+ (12  39.000)
//
// Step2. $0 sẽ có giá trị là kết quả của step 1, và $1 là object ở index = 1 của array books. Kết quả return của Closure là $0 (=468.000) + (9 * 22.000). Step này sẽ được lặp lại cho đến hết array books. Về cơ bản, step 1 và 2 chỉ khác nhau ở chỗ, ở step 1, $0 chưa có giá trị, nên nó sẽ được chỉ định là giá trị của parameter thứ nhất của Closure reduce().
// */
//var ages1: [Int] = [1,3,5,67,25,8,89]
//ages1.sorted() {
//    $1 > $0
//}
//
//
//
//
//
//
////              @nonescaping closure
//
//func getSumOf(numbers: [Int], completion: (Int) -> Void) {
//    // 2. Excute function.
//    var sum = 0
//    for aNumber in numbers {
//        sum += aNumber
//    }
//
//    // 3. Function excute closure.
//    completion(sum)
//}
//
//func doSomething() {
//    // 1. Gọi function, truyền closure vào làm tham số.
//    getSumOf(numbers: [34, 16, 231, 6 , 23, -83]) { result in
//        print("Sum is \(result)")
//        // 4. Closure được excute xong, return compiler và closure out of scope, bị giải phóng khỏi bộ nhớ.
//    }
//}
//class Child {
//
//    func doTheThing(closure: () -> Void) {
//        closure()
//    }
//
//}
//class Parent {
//
//    var child = Child()
//    var name = "Ronny"
//    func doStuff() {
//        child.doTheThing {
//            // Không cần self.name
//            name = "Steven"
//        }
//    }
//
//}
//
//////////////////////////
//
//var complitionHandler: ((String) -> Void)?
//
//func requestURL(urlString: String, handler: @escaping (String) -> Void) {
//    // 2. Excute function.
//    var response = ""
//        // Call API code
////     ...
//
//        // 3. Closure được gán lại thành property, không bị out of scope
//        complitionHandler = handler
//}
//
//func loadData() {
//    // 1. Gọi function, truyền closure vào làm tham số.
//    requestURL(urlString:"https://mocky.io/api/v1/accounts") { response in
//        // Handle response string code
////        ...
//        // 4. Closure được excute xong, return compiler, nhưng vẫn được giữ lại trong bộ nhớ.
//    }
//
//}


//func getSumOf(numbers: [Int], completion: @escaping (Int) -> Void) {
//    // 2. Excute function.
//    var sum = 0
//    for aNumber in numbers {
//        sum += aNumber
//    }
//
//    // Delay 5s và excute closure trên global queue.
//    DispatchQueue.glonal.asyncAfter(deadline: .now() + 5) {
//        completion(sum)
//    }
//
//}
//func doSomething() {
//    // 1. Gọi function, truyền closure vào làm tham số.
//    getSumOf(numbers: [34, 16, 231, 6 , 23, -83]) { result in
//        print("Sum is \(result)")
//        // 4. Closure được excute xong, return compiler và closure chưa bị giải phóng vì đang được giữ lại trên queue khác để excute sau.
//    }
//
//}


UserDefaults.standard.set(true, forKey: "Key") //Bool
UserDefaults.standard.set(1, forKey: "Key")  //Integer
UserDefaults.standard.set("TEST", forKey: "Key") //setObject

UserDefaults.standard.bool(forKey: "Key")
UserDefaults.standard.integer(forKey: "Key")
UserDefaults.standard.string(forKey: "Key")

// Xoa 1 phan
UserDefaults.standard.removeObject(forKey: "Key")

//Xóa tất cả các phím
if let appDomain = Bundle.main.bundleIdentifier {
    UserDefaults.standard.removePersistentDomain(forName: appDomain)
}

