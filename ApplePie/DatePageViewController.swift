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
    
    lazy var subViewControllers : [UIViewController] = {
        
        let beforeDateVC = DateViewController()
        let presentDateVC = DateViewController()
        presentDateVC.view.backgroundColor = .green
        let afterDateVC = DateViewController()
        
        return [beforeDateVC,presentDateVC,afterDateVC]
        
    }()
    
    override func viewDidLoad() {
        
        self.delegate = self
        self.dataSource = self
        self.view.backgroundColor = .red
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
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
            
            return nil
            
        }
        print(currentIndex)
        return subViewControllers[currentIndex-1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.index(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count-1 {
            return nil
        }
        print(currentIndex)
        return subViewControllers[currentIndex+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
    
    
    
    
    
    
}
