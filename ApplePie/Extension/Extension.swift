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
    
    public func getFirstDayInMonth(_ date:Date) -> Int {
        
        let calender = Calendar.current
        let components = DateComponents(calendar: calender,year: date.getYear, month: date.getMonth, day:1)
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
    
    public func getDates(_ date:Date) -> [DateModel] {
        
        var dateModel = [DateModel]()
        
        let calendar = Calendar.current
        let dayInt = getFirstDayInMonth(date)
        let dateComponents = calendar.dateComponents([.year,.month], from: date)
        let range = calendar.range(of: .day, in: .month, for: date)
        guard let numberOfDays = range?.count else { return [] }
        
        if dayInt-2 > 0 {
            
            for _ in 0...dayInt-2 {
                
                let components = DateComponents(calendar: calendar,year: 1990, month: 12)
                let dummyDates = DateModel(date: components.date!)
                dateModel.append(dummyDates)
                
            }
            
        }
        
        for i in 1...numberOfDays {
            
            let components = DateComponents(calendar: calendar,year:dateComponents.year, month: dateComponents.month, day: i)
            let dates = DateModel(date: components.date!)
            dateModel.append(dates)
            
        }
        
        return dateModel
    }
    
    
    public func getMonthString(_ index:Int) -> String {
        
        let month = Month.January
        
        return month.strMonth(index)
        
    }
    
    public var getYear : Int {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        let year =  components.year
        
        return year!
        
    }
    
    public var getMonth : Int {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)
        
        return components.month!
        
    }
    
    public var getDay : Int {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        
        let day = components.day
        
        return day!
        
    }
    
    public var changeDateToString : String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFormatter.string(from: self)
        
        return dateStr
    }
    
    public func changeStringToDate(_ dateStr : String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }

}
