
//: Playground - noun: a place where people can play

import UIKit

/*class LocationManager{
    //MARK: - Location Permission
    func requestForLocation(){
        //Code Process
        print("Location granted")
    }
    
}
//Access the class
let location = LocationManager() //initialization class
location.requestForLocation()    //Call function here

/// MARK: Singleton
class locationManager{
    
    static let shared = locationManager()
    
    init(){}
    
    func requestForLocation(){
        //Code Process
        print("Location granted")
    }
    
}
//Access class function with Singleton Pattern 🚀
locationManager.shared.requestForLocation()  //"Location granted"
//Still you can use your class like this
let locations = LocationManager()
location.requestForLocation()

*/

//Better Singleton
class LocationManager{
    
    static let shared = LocationManager()
    
    var locationGranted: Bool?
    //Initializer access level change now
    private init(){}
    
    func requestForLocation(){
        //Code Process
        locationGranted = true
        print("Location granted")
    }
    
}
//Access class function in a single line
LocationManager.shared.requestForLocation()
