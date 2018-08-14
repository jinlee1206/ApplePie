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


class DatePageViewController : UIPageViewController {
    
    var dates = [[String]]()
    
    let firstDateVC : DateViewController = {
       
        let vc = DateViewController()
        vc.view.tag = 0
        vc.view.backgroundColor = .red
        
        return vc
        
    }()
    
    let secondDateVC : DateViewController = {
        
        let vc = DateViewController()
        vc.view.tag = 1
        vc.view.backgroundColor = .blue
        
        return vc
        
    }()
    
    let thirdDateVC : DateViewController = {
        
        let vc = DateViewController()
        vc.view.tag = 2
        vc.view.backgroundColor = .green
        
        return vc
        
    }()
    
    
    lazy var subViewControllers : [UIViewController] = {
        
        return [firstDateVC,secondDateVC,thirdDateVC]
        
    }()
    
    override func viewDidLoad() {
        
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
        
        updateDatesArray(Date()) {
            
            self.firstDateVC.dates = self.dates[1]
            self.secondDateVC.dates = self.dates[2]
            self.thirdDateVC.dates = self.dates[0]
            
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
        
        if completed {
            
        }
        
    }
   
}

extension DatePageViewController {
    
    private func updateDatesArray(_ centerDate : Date,completion:(() ->Void)? = nil) {
        
        self.dates = []
        
        DispatchQueue.global().sync {
            
            let calendar = Calendar.current
            let centerDate = centerDate
            guard let leftDate = calendar.date(byAdding: .month, value: -1, to: centerDate) else { return }
            guard let rightDate = calendar.date(byAdding: .month, value: +1, to: centerDate) else { return }
            
        
            let dateArray = [leftDate,centerDate,rightDate]
            
            dateArray.forEach({
                
                let components = calendar.dateComponents([.year,.month,.day], from: $0)
                guard let year = components.year else { return }
                guard let month = components.month else { return }
                
                let days = Date.days(year: year, month: month)
                self.dates.append(days)
                
                DispatchQueue.main.async {
                    
//                    self.changeMonthAndYear(month)
                    
                }
                
            })
            
            completion?()
        }
        
    }
    
}
