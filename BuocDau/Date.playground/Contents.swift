//: Playground - noun: a place where people can play

import UIKit

let curentDate = Date()
print(curentDate)

let date = Date.init(timeIntervalSinceNow: 86400)
print(date)

let dateOnly = Date.init(timeIntervalSinceReferenceDate: 86400)
print(dateOnly)

let calendar = Calendar.current
var components = DateComponents()

components.day = 5
components.month = 10
components.year = 2018
components.hour = 11
components.minute = 11

let newDate = calendar.date(from: components)
print(newDate ?? 0)


// Convert Date sang String
// Convert với dateStyle và timeStyle định sẵn
// Date style và Time style có 5 options:

public enum Style : UInt {
    case none
    case short
    case medium
    case long
    case full
}
// code
let currentDate = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full
let dateString = dateFormatter.string(from: currentDate)
print(dateString)

//Convert với style tự định nghĩa:

let currentDateOnly = Date()
let dateFormatterOnly = DateFormatter()
dateFormatterOnly.dateFormat = "MMMM-dd-yyyy HH:mm"
let dateStringOnly = dateFormatter.string(from: currentDate)
print(dateStringOnly)

//Convert String to Date:
//Lưu ý, dateFormat của DateFormatter() phải trùng với date format của string. Nếu không thì kết quả trả về sẽ nil

//Ví dụ không trùng với date format của string:
let dateStringConvert = "26-06-2018"
let dateFormatterConvert = DateFormatter()
dateFormatterConvert.dateFormat = "MM-dd-yyyy"
let dateFromStringConvert = dateFormatter.date(from: dateString)
print(dateFromStringConvert ?? 0)
//Result: nil
//Ví dụ trùng với date format của string:
let dateStringConvertDay = "26-06-2018"
let dateFormatterConvertDay = DateFormatter()
dateFormatterConvertDay.dateFormat = "dd-MM-yyyy"
let dateFromStringConvertDay = dateFormatter.date(from: dateString)
print(dateFromStringConvertDay ?? 0)
//Result: Optional(2018-06-25 17:00:00 +0000)


//So sánh rất đơn giản, chỉ dùng các toán tử >, <, == là so sánh được.

let start = "2017-05-25"
let end = "2017-05-25"
let dateFormat = "yyyy-MM-dd"

let dateFormatterCompare = DateFormatter()
dateFormatterCompare.dateFormat = dateFormat

let startDate = dateFormatterCompare.date(from: start)
let endDate = dateFormatterCompare.date(from: end)

guard let startDate = startDate, let endDate = endDate else {
    fatalError("Date Format does not match ⚠️")
}

if startDate < endDate {
    print("Early")
} else if startDate > endDate {
    print("Later")
} else {
    print("Equal")
}

// Get components of Date
let dateCurrentCompare = Date()
let calendarCompare = Calendar.current
let componentsCompare = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrentCompare)
print("Day:\(componentsCompare.day!) Month:\(componentsCompare.month!) Year:\(componentsCompare.year!)")

