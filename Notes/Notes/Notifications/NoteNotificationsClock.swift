//
//  NoteNotificationsClock.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/18/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import Foundation
import UIKit

class NoteNotificationsClock: NSObject, NSCoding {

    // Propertion
    var notification: UILocalNotification
    var nameClock: String
    var timeClock: NSDate
    
    // Archive Paths for Persistent Data
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("reminders")
    
    // enum for property types
    struct PropertyKey {
        static let nameKey = "nameClock"
        static let timeKey = "timeClock"
        static let notificationKey = "notification"
    }
    // Initializer
    init(nameclock: String, timeclock: NSDate, notification: UILocalNotification) {
        // set properties
        self.nameClock = nameclock
        self.timeClock = timeclock
        self.notification = notification
        
        super.init()
    }
    
    // Destructor
    deinit {
        // cancel notification
        UIApplication.shared.cancelLocalNotification(self.notification)
    }
    
    // NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nameClock, forKey: PropertyKey.nameKey)
        aCoder.encode(timeClock, forKey: PropertyKey.timeKey)
        aCoder.encode(notification, forKey: PropertyKey.notificationKey)
    }
    

    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let time = aDecoder.decodeObject(forKey: PropertyKey.timeKey) as! NSDate
        
        let notification = aDecoder.decodeObject(forKey: PropertyKey.notificationKey) as! UILocalNotification
        
        // Must call designated initializer.
        self.init(nameclock: name, timeclock: time, notification: notification)
    }
}
