//: Playground - noun: a place where people can play

import UIKit

protocol Observer{
    var id : Int{ get }
    func update()
}


class Subject{
    
    private var observerArray = [Observer]()
    private var _number = Int()
    var number : Int {
        set {
            _number = newValue
            notify()
        }
        get {
            return _number
        }
    }
    
    func attachObserver(observer : Observer){
        observerArray.append(observer)
    }
    
    func removeObserver(observer : Observer) {
        observerArray = observerArray.filter{ $0.id != observer.id }
    }
    
    private func notify(){
        for observer in observerArray {
            observer.update()
        }
    }
    
}


class BinaryObserver : Observer{
    
    private var subject = Subject()
    var id = Int()
    
    init(subject : Subject, id : Int) {
        self.subject = subject
        self.subject.attachObserver(observer: self)
        self.id = id
    }
    
    func update(){
        print("Binary: \(String(subject.number, radix: 2))")
    }
}


//Thực thi của Hexa Observer

class HexaObserver : Observer{
    
    private var subject = Subject()
    var id = Int()
    
    init(subject : Subject, id : Int) {
        self.subject = subject
        self.subject.attachObserver(observer: self)
        self.id = id
    }
    
    func update(){
        print("Hex: \(String(subject.number, radix: 16))")
    }
    
}


//Thực thi của Octal Observer

class OctalObserver : Observer{
    
    private var subject = Subject()
    var id = Int()
    
    init(subject : Subject, id : Int) {
        self.subject = subject
        self.subject.attachObserver(observer: self)
        self.id = id
    }
    
    func update(){
        print("Octal: \(String(subject.number, radix: 8))")
    }
    
}


//Demo
let subject = Subject()

let binary = BinaryObserver(subject: subject, id: 1)
let octal = OctalObserver(subject: subject, id: 2)
let hex = HexaObserver(subject: subject, id: 3)

subject.number = 15
subject.removeObserver(observer: binary)
subject.number = 2
