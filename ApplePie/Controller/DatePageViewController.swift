//
//  DatePageViewController.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 13..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import RJExtension
import UIKit

protocol DatePageViewControllerDelegate : class {
    func changeMonthAndYear(_ monthModel:MonthModel)
}


class DatePageViewController : UIPageViewController {
    
    // Delegate
    weak var datePageVCDelegate : DatePageViewControllerDelegate?
    
    // UI
    let firstDateVC : DateViewController = {
        
        let vc = DateViewController()
        vc.view.tag = 0
        
        return vc
        
    }()
    
    let secondDateVC : DateViewController = {
        
        let vc = DateViewController()
        vc.view.tag = 1
        
        return vc
        
    }()
    
    let thirdDateVC : DateViewController = {
        
        let vc = DateViewController()
        vc.view.tag = 2
        
        return vc
        
    }()
    
    
    lazy var subViewControllers : [UIViewController] = {
        
        return [firstDateVC,secondDateVC,thirdDateVC]
        
    }()
    
    
    // Data
    var currentPageIndex : Int = 1  // 현재페이지 인덱스
    var monthModel = [MonthModel]() {
        
        didSet {
            
            if monthModel.count != 0 { passDaysDate() }
            
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewControllers[1]], direction: .forward, animated: true, completion: nil)
        
        updateMonthsArray(date: Date()) {[weak self] (monthModelArray) in
            
            self?.monthModel = monthModelArray
        }
    }
}


//MAKR:- UIPageViewControllerDelegate & UIPageViewControllerDataSource
extension DatePageViewController : UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = subViewControllers.index(of: viewController) ?? 0
        if currentIndex <= 0 {
            
            return subViewControllers.last
            
        }
        
        return subViewControllers[currentIndex-1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.index(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count-1 {
            
            return subViewControllers.first
        }
        
        return subViewControllers[currentIndex+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // 페이지 넘긴후
        if completed {
            
            let previousIndex = self.currentPageIndex
            self.currentPageIndex = (pageViewController.viewControllers?.first?.view.tag)!
            var centerDate : Date?
            
            switch previousIndex {
                
            case 0: // firstDateVC
                //왼쪽                                                            // 오른쪽
                if self.currentPageIndex == 2 { centerDate = self.monthModel[0].monthDate } else if self.currentPageIndex == 1 { centerDate = self.monthModel[2].monthDate }
                
            case 1: // secondDateVC
                //왼쪽                                                            // 오른쪽
                if self.currentPageIndex == 0 { centerDate = self.monthModel[0].monthDate } else if self.currentPageIndex == 2 { centerDate = self.monthModel[2].monthDate }
                
            case 2: // thirdDateVC
                //왼쪽                                                            // 오른쪽
                if self.currentPageIndex == 1 { centerDate = self.monthModel[0].monthDate } else if self.currentPageIndex == 0 { centerDate = self.monthModel[2].monthDate }
                
            default :
                
                break
            }
            
            
            updateMonthsArray(date: centerDate!) {[weak self] (monthModelArray) in
                
                self?.monthModel = monthModelArray
                guard let currentPageMonth = self?.monthModel[1] else { return }
                self?.datePageVCDelegate?.changeMonthAndYear(currentPageMonth)
                
            }
            
        }
        
    }
    
    
}

extension DatePageViewController {
    
    private func updateMonthsArray(date centerDate:Date,completion: @escaping (([MonthModel]) -> Void)) {
        
        self.monthModel = []
        
        DispatchQueue.global().sync {
            
            var monthModelArray = [MonthModel]()
            
            let calendar = Calendar.current
            let date = centerDate
            guard let leftDate = calendar.date(byAdding: .month, value: -1, to: date) else { return }
            guard let rightDate = calendar.date(byAdding: .month, value: +1, to: date) else { return }
            
            let months = [leftDate,date,rightDate]
            
            for date in months {
                
                let components = calendar.dateComponents([.year,.month], from: date)
                
                guard let year = components.year else { return }
                guard let  month = components.month else { return }
                
                let dates = Date().getDates(date)
                let monthModel = MonthModel(year: year, month: month, monthDate: date, dates: dates)
                monthModelArray.append(monthModel)
                
            }
            
            completion(monthModelArray)
        }
        
    }
    
    // 데이터 전달
    private func passDaysDate() {
        
        switch self.currentPageIndex {
            
        case 0:
            firstDateVC.dateModel = self.monthModel[1].dates
            secondDateVC.dateModel = self.monthModel[2].dates
            thirdDateVC.dateModel = self.monthModel[0].dates
        case 1:
            firstDateVC.dateModel = self.monthModel[0].dates
            secondDateVC.dateModel = self.monthModel[1].dates
            thirdDateVC.dateModel = self.monthModel[2].dates
            break
        case 2:
            firstDateVC.dateModel = self.monthModel[2].dates
            secondDateVC.dateModel = self.monthModel[0].dates
            thirdDateVC.dateModel = self.monthModel[1].dates
            break
        default:
            break
            
            
        }
        
    }
    
    
//    // 데이터 전달
//    private func passDaysDate() {
//
//        switch self.currentPageIndex {
//
//        case 0:
//            firstDateVC.dates = self.daysArray[1]
//            secondDateVC.dates = self.daysArray[2]
//            thirdDateVC.dates = self.daysArray[0]
//        case 1:
//            firstDateVC.dates = self.daysArray[0]
//            secondDateVC.dates = self.daysArray[1]
//            thirdDateVC.dates = self.daysArray[2]
//            break
//        case 2:
//            firstDateVC.dates = self.daysArray[2]
//            secondDateVC.dates = self.daysArray[0]
//            thirdDateVC.dates = self.daysArray[1]
//            break
//        default:
//            break
//
//
//        }
//
//    }
    
}
