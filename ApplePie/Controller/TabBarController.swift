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
        
        viewControllers = [questionVC]
    }
}


