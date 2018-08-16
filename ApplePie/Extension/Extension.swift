//
//  Extension.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 9..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

enum Month : String {
    
    case January
    case Febuary
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
    
    func strMonth(_ indexPathItem:Int) -> String {

        switch indexPathItem {
            
        case 1 :
            return Month.January.rawValue
        case 2 :
            return Month.Febuary.rawValue
        case 3 :
            return Month.March.rawValue
        case 4 :
            return Month.April.rawValue
        case 5 :
            return Month.May.rawValue
        case 6 :
            return Month.June.rawValue
        case 7 :
            return Month.July.rawValue
        case 8 :
            return Month.August.rawValue
        case 9 :
            return Month.September.rawValue
        case 10 :
            return Month.October.rawValue
        case 11 :
            return Month.November.rawValue
        case 12 :
            return Month.December.rawValue
        default:
            return "Error"
        }
        
    }
    
}




public extension Date {
    
    public func getWhatDay(year:Int,month:Int,day:Int) -> Int {
        
        let calender = Calendar.current
        let components = DateComponents(calendar: calender,year: year, month: month, day: day)
        let dayInt = calender.component(.weekday, from: components.date!)
        
        /*
            1 = Sunday
            2 = Monday
            3 = Tuesday
            4 = Wednesday
            5 = Thursday
            6 = Firday
            7 = Saturday
        */
        
        return dayInt

    }
    
    public static func getPreviousLastDays(_ previousDate:Date) -> [String] {
        
        var previousDays = [String]()
        
        let calendar = Calendar.current
        let date = previousDate // 이전달 Date
        let components = DateComponents(calendar: calendar,year: date.getYear(), month:date.getMonth(), day:date.getDay())
        var dayInt = calendar.component(.weekday, from: components.date!)
        let range = calendar.range(of: .day, in: .month, for: previousDate)!
        var lastDay = range.count
        
        while !(dayInt == 1) {
            
            dayInt -= 1
            lastDay -= 1
            previousDays.insert(lastDay.description, at: 0)
        }
        
        return previousDays
    }
    
    public static func days(_ date:Date) -> [String] {
        
        var days = [String]()
        
        let calendar = Calendar.current
        let previousDate = calendar.date(byAdding: .month, value: -1, to: date)
        let previousDays = getPreviousLastDays(previousDate!)
        previousDays.forEach({ days.append($0) })
        
//        let components = calendar.dateComponents([.year,.month,.day], from: date)
        
//        let targetDate = calendar.date(from: components)
        let range = calendar.range(of: .day, in: .month, for: date)
        guard let numberOfDays = range?.count else { return []}
    
//        let dateComponents = DateComponents(year: year, month: month)
//        let date = calendar.date(from: dateComponents)!
//        let range = calendar.range(of: .day, in: .month, for: date)!
//        let numberOfDays = range.count
        
        //        var addtionalDay = getWhatDay(year: year, month: month, day: numberOfDays)
        //
        //        while !(addtionalDay == 1) {
        //
        //            addtionalDay -= 1
        //            numDays -= 1
        //            days.insert(numDays.description, at: 0)
        //        }
        

        
        for i in 1...numberOfDays {
        
            days.append(i.description)
        }
    
//        return [String]()
        return days
    }
    
//    public static func days(year:Int,month:Int) -> [String] {
//
//        let calendar = Calendar.current
//        let date = centerDate
//        guard let leftDate = calendar.date(byAdding: .month, value: -1, to: date) else { return [] }
//
//        let dateComponents = DateComponents(year: year, month: month)
//        let calendar = Calendar.current
//        let date = calendar.date(from: dateComponents)!
//        let range = calendar.range(of: .day, in: .month, for: date)!
//        let numberOfDays = range.count
//        var days = [String]()
////        var addtionalDay = getWhatDay(year: year, month: month, day: numberOfDays)
////
////        while !(addtionalDay == 1) {
////
////            addtionalDay -= 1
////            numDays -= 1
////            days.insert(numDays.description, at: 0)
////        }
//
//        for i in 1...range.count {
//
//            days.append(i.description)
//        }
//
//        return days
//    }
    
    
    public func getYear() -> Int {
    
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        let year =  components.year
        
        return year!
        
    }
    
    public func getMonth() -> Int {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)

        return components.month!
        
    }
    
    public func getDay() -> Int {
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
    
        let day = components.day
        
        return day!
        
    }
  
    
}
