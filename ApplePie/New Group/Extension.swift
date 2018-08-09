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
            
        case 0 :
            return Month.January.rawValue
        case 1 :
            return Month.Febuary.rawValue
        case 2 :
            return Month.March.rawValue
        case 3 :
            return Month.April.rawValue
        case 4 :
            return Month.May.rawValue
        case 5 :
            return Month.June.rawValue
        case 6 :
            return Month.July.rawValue
        case 7 :
            return Month.August.rawValue
        case 8 :
            return Month.September.rawValue
        case 9 :
            return Month.October.rawValue
        case 10 :
            return Month.November.rawValue
        case 11 :
            return Month.December.rawValue
        default:
            return "Error"
        }
        
    }
    
}




public extension Date {
    
    public static func getWhatDay(year:Int,month:Int,day:Int) -> Int {
        
        let calender = Calendar.current
        let components = DateComponents(calendar: calender,year: year, month: month, day: day)
        let dayInt = calender.component(.weekday, from: components.date!)
        
        return dayInt

    }
    
    public static func days(year:Int,month:Int) -> [String] {
        
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        
        var numDays = range.count
        var days = [String]()
        
        var addtionalDay = getWhatDay(year: year, month: month, day: numDays)
        
        while !(addtionalDay == 1) {
            
            addtionalDay -= 1
            numDays -= 1
            days.insert(numDays.description, at: 0)
        }
        
        for i in 1...range.count {
            
            days.append(i.description)
        }
        
        return days
    }
    
    
    public static func currentYear() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: date)
        
        let year =  components.year?.description
        
        return year!
        
    }
    
    public static func currentMonth() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        
        let month = components.month?.description
        
        return month!
        
    }
    
    public static func currentDay() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
    
        let day = components.date?.description
        
        return day!
        
    }
  
    
}
