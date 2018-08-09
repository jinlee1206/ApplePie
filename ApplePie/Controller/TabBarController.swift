//
//  TabBarController.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 8..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

class TabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
        
    }
        
}

extension TabBarController : UITabBarControllerDelegate  {
    
    func setupTabBarController() {
        
        self.delegate = self
        self.view.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
//        let questionNVC = UINavigationController(rootViewController: CalendarViewController())
        
        let questionVC = CalendarViewController()
        questionVC.title = "캘린더"
//        questionNVC.tabBarItem.selectedImage = UIImage(named: "tabOneSelected")?.withRenderingMode(.alwaysOriginal)
//        questionNVC.tabBarItem.image = UIImage(named: "tabOneDeselected")?.withRenderingMode(.alwaysOriginal)
//        questionNVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
//        let myPageNVC = UINavigationController(rootViewController: MyPageViewController())
//        myPageNVC.tabBarItem.selectedImage = UIImage(named: "tabTwoSelected")?.withRenderingMode(.alwaysOriginal)
//        myPageNVC.tabBarItem.image = UIImage(named: "tabTwoDeselected")?.withRenderingMode(.alwaysOriginal)
//        myPageNVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
//        let calendar = Calendar.current
//
//
//        let originDate = Date()
//        let firstDate = Date()
//        let secondDate = calendar.date(from: DateComponents(year: 2018, month: 8, day: 15))
//
//        let nextMonth = Calendar.current.date(byAdding:.month, value: 1, to: originDate)
//        let previousMonth = Calendar.current.date(byAdding:.month, value: -1, to: originDate)
//
//        print(nextMonth)
//        print(previousMonth)
        
        //calendar.component(.day, from: date)
        //calendar.component(.month, from: date)
        //calendar.component(.year, from: date)
        //calendar.component(.timeZone, from: date)
        //calendar.component(.yearForWeekOfYear, from: date)
        
        
//        var components = calendar.dateComponents([.year, .month, .day,.hour,.minute], from: originDate)
//        calendar.date(from: components)
//
//        calendar.dateComponents([.day], from: firstDate, to: secondDate!)
        
        
        // Calculate start and end of the current year (or month with `.month`):
//        let interval = calendar.dateInterval(of: .month, for: originDate)! //change year it will no of days in a year , change it to month it will give no of days in a current month
        
        
        
        // Compute difference in days:
//        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
//        print(interval)
//        print(days)
        
        viewControllers = [questionVC]
    }
}


