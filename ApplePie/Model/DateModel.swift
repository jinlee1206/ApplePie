//
//  DateModel.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 9..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

public struct MonthModel {
    
    let year : Int
    let month : Int
    let monthDate : Date
    let dates : [DateModel]
    
    init(year:Int,month:Int,monthDate:Date,dates:[DateModel]) {
        
        self.year = year
        self.month = month
        self.monthDate = monthDate
        self.dates = dates
        
//        var dates = [DateModel]()
//        
//        let calendar = Calendar.current
//        let dayInt = Date().getFirstDayInMonth(monthDate)
//        let dateComponents = calendar.dateComponents([.year,.month], from: monthDate)
//        let range = calendar.range(of: .day, in: .month, for: monthDate)
//        let numberOfDays = range?.count
//
//        if dayInt-2 > 0 {
//
//            for _ in 0...dayInt-2 {
//
//                let components = DateComponents(calendar: calendar,year: 1990, month: 12, day:6)
//                let dateModel = DateModel(date: components.date!)
//                dates.append(dateModel)
//
//            }
//
//        }
//
//        for i in 1...numberOfDays! {
//
//            let components = DateComponents(calendar: calendar,year:dateComponents.year, month: dateComponents.month, day: i)
//            let dateModel = DateModel(date: components.date!)
//            dates.append(dateModel)
//
//        }
//
//        self.dates = dates

    }
    
}

public struct DateModel {
    
    let year : String?
    let month : String?
    let day : String?
    let date : Date

    init(date:Date) {
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year,.month,.day], from: date)
    
        self.date = date
        self.year = dateComponents.year?.description
        self.month = dateComponents.month?.description
        self.day = dateComponents.day?.description
        
    }

}



