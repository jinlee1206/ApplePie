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
    func changeMonthAndYear(month:String,year:String)
}


class DatePageViewController : UIPageViewController {
    
    // Delegate
    weak var datePageVCDelegate : DatePageViewControllerDelegate?
    
    // UI
    let firstDateVC : DateViewController = {
       
        let vc = DateViewController()
        vc.view.tag = 0
        vc.calenderCollectionView.backgroundColor = .red
        
        return vc
        
    }()
    
    let secondDateVC : DateViewController = {
        
        let vc = DateViewController()
        vc.view.tag = 1
        vc.calenderCollectionView.backgroundColor = .blue
        
        return vc
        
    }()
    
    let thirdDateVC : DateViewController = {
        
        let vc = DateViewController()
        vc.view.tag = 2
        vc.calenderCollectionView.backgroundColor = .green
        
        return vc
        
    }()
    
    
    lazy var subViewControllers : [UIViewController] = {
        
        return [firstDateVC,secondDateVC,thirdDateVC]
        
    }()
    
    
    // Data
    var currentPageIndex : Int = 1  // 현재페이지 인덱스
    var dates = [Date]() // index 0 = 한달전 1 = 현재달 2 = 한달후
    var daysArray = [[String]]() // 달에 따른 일수


    override func viewDidLoad() {
        
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewControllers[1]], direction: .forward, animated: true, completion: nil)
        
        updateDatesArray(date: Date()) {[weak self] (daysArray, dates) in
            self?.daysArray = daysArray
            self?.dates = dates
            self?.passDaysDate()
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
                    if self.currentPageIndex == 2 { centerDate = self.dates[0] } else if self.currentPageIndex == 1 { centerDate = self.dates[2] }
                
                case 1: // secondDateVC
                                                    //왼쪽                                                            // 오른쪽
                    if self.currentPageIndex == 0 { centerDate = self.dates[0] } else if self.currentPageIndex == 2 { centerDate = self.dates[2] }
                
                case 2: // thirdDateVC
                                                    //왼쪽                                                            // 오른쪽
                    if self.currentPageIndex == 1 { centerDate = self.dates[0] } else if self.currentPageIndex == 0 { centerDate = self.dates[2] }

                default :

                    break
            }
            
            updateDatesArray(date:centerDate!) {[weak self] (daysArray, dates) in
                self?.daysArray = daysArray
                self?.dates = dates
                self?.passDaysDate()
                let monthStr = Month.January
                let centerDate = dates[1]
                let monthInt = centerDate.getMonth()
                let month = monthStr.strMonth(monthInt)
                let year = centerDate.getYear().description
                
                self?.datePageVCDelegate?.changeMonthAndYear(month: month, year: year)
                
            }

        }
        
    }
    
   
}

extension DatePageViewController {
    
    
    /*
     
     센터 데이트 기준으로
     컴플리션에 왼쪽,중앙,오른쪽 days 2차원배열로 반환
             왼쪽,중앙,오른쪽 Date 반환
     
     
    */
    
    private func updateDatesArray(date centerDate:Date,completion:(([[String]],[Date]) ->Void)? = nil) {
        
        self.dates = []
        self.daysArray = []
        
        DispatchQueue.global().sync {
            
            let calendar = Calendar.current
            let date = centerDate
            guard let leftDate = calendar.date(byAdding: .month, value: -1, to: date) else { return }
            guard let rightDate = calendar.date(byAdding: .month, value: +1, to: date) else { return }
            
            let dateArray = [leftDate,date,rightDate]
            var daysArray = [[String]]()
            
            dateArray.forEach({
                
                let components = calendar.dateComponents([.year,.month,.day], from: $0)
                guard let year = components.year else { return }
                guard let month = components.month else { return }
                
                let days = Date.days($0)
                daysArray.append(days)
                
                DispatchQueue.main.async {
                    
                }
                
            })
            
            completion?(daysArray, dateArray)
        }
        
    }

    
    //
    private func passDaysDate() {
        
        switch self.currentPageIndex {
            
        case 0:
            
            firstDateVC.dates = self.daysArray[1]
            secondDateVC.dates = self.daysArray[2]
            thirdDateVC.dates = self.daysArray[0]
        case 1:
            firstDateVC.dates = self.daysArray[0]
            secondDateVC.dates = self.daysArray[1]
            thirdDateVC.dates = self.daysArray[2]
            break
        case 2:
            firstDateVC.dates = self.daysArray[2]
            secondDateVC.dates = self.daysArray[0]
            thirdDateVC.dates = self.daysArray[1]
            break
        default:
            break
        }
  
    }
    
}
