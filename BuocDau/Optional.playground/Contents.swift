//: Playground - noun: a place where people can play
//struct Preson {
//    let givenName: String
//    let familyName: String
//    let middleName: String?
//}
//let me = Preson(givenName: "Ngo", familyName: "Bao", middleName: nil)
//print("\(me.familyName)")
//print("\(me.givenName)")
//print("\(me.middleName!)")

/*let middleName: String? = "Cupnoodle"
// non optional String to store unwrapped value
// notice the same variable name 'middleName" on left and right
if let middleName = middleName {
//    the middleNamr ussed inside the 'if left' is non-optional / unwrapped
    print("\(middleName)")
}
*/




//    nếu như let middleName: String thì me lỗi vì middleName lúc khai báo k đ nill
    
//    var displayName: String {
//        return givenName + " " + middleName! + " " + familyName
//    }
//}
//let me = Preson(givenName: "Mau", familyName: "Bao", middleName: nil)

////Kiểm tra tránh tình trạng middeName nil
//    if middeName != nil {
//    print(middleName)
//}


struct Person {
    let givenName: String
    let familyName: String?
    let middleName: String
    let pet: Pet?
    
    func eat(){
        print("\(givenName) nom nom")
    }
}

struct Pet {
    func makeNoise(){
        print("woof")
    }
}
let vulpes : Pet? = Pet()
//let axel : Person? = Person(firstName: "Axel", middleName: nil, lastName: "Kee", pet: vulpes)
let axel : Person? = Person(givenName: "Axel", familyName: "Kee", middleName: nil, pet: vulpes)

// makeNoise will only execute if axel is not nil and axel's pet is not nil
axel?.pet?.makeNoise()

//output 'woof'




