//
//  AirlineViewController.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 6..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import SnapKit
import UIKit
import RJExtension

enum Direction {
    case LEFT
    case RIGHT
}


class CalendarViewController : UIViewController {
    
    // UI
    let yearMenuTableView = YearMenuTableView()
    let customNaviView = CustomNaviView()
    lazy var dayStackView : UIStackView = {
        
         let sv = UIStackView(arrangedSubviews:createDayLabel("S","M","T","W","T","F","S"))
         sv.axis = .horizontal
         sv.distribution = .fillEqually
        
        return sv
    }()
    
    let calendarScrollView = CalendarScrollView()
    
    
    // Data
    
    // index 0 == 저번달
    // index 1 == 이번달
    // index 2 == 다음달
    var beforeDate = Date()
    var centerDate = Date()
    var afterDate = Date()
    var dates = [[String]]()
    
}


//MARK:- Life Cycle
extension CalendarViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupActions()
        updateDatesArray(Date()) {
            
        }
    

    }
    
}


//MARK:- SetupViews
extension CalendarViewController {
    
    private func setupViews() {
        
        [
            
            dayStackView,
            calendarScrollView,
            yearMenuTableView,
            customNaviView

        ].forEach({view.addSubview($0)})
        
        
        yearMenuTableView.snp.makeConstraints {
            
            $0.top.equalTo(self.customNaviView.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(56)
            
        }
        
        customNaviView.snp.makeConstraints {
            
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(56)
            
        }
        
        dayStackView.snp.makeConstraints {
            $0.top.equalTo(self.customNaviView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        calendarScrollView.snp.makeConstraints {
            
            $0.top.equalTo(self.dayStackView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(self.view.frame.width)
            $0.height.equalTo(self.view.frame.width-(self.view.frame.width/7))
            
        }
        
    }
    
    
    private func createDayLabel(_ named:String...) -> [UILabel] {
        
        return named.map { name in
            
            let label = UILabel()
            var textColor = UIColor.black
            textColor = name == "S" ? .red : .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = name
            label.font = UIFont.preferredFont(forTextStyle: .headline)
            label.textAlignment = .center
            label.textColor = textColor
            return label
        }
        
    }


}



//MARK:- Private Func
extension CalendarViewController {
    
//    private func insertAndDeleteCell(direction:Direction) {
//
//        let firstIndexPath = IndexPath(item: 0, section: 0)
//        let lastIndexPath = IndexPath(item: 2, section: 0)
//
//        switch direction {
//
//        case .LEFT:
//
//            self.centerDate = self.beforeDate
//            self.dates.remove(at:2)
//            self.calenderCollectionView.deleteItems(at: [lastIndexPath])
//            updateDatesArray(self.centerDate, completion: nil)
//            self.calenderCollectionView.insertItems(at: [firstIndexPath])
//            self.calenderCollectionView.scrollToItem(at:IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
//
//
//
//        case .RIGHT:
//            self.centerDate = self.afterDate
//            self.dates.remove(at:0)
//            self.calenderCollectionView.deleteItems(at: [firstIndexPath])
//            updateDatesArray(self.centerDate, completion: nil)
//            self.calenderCollectionView.insertItems(at: [lastIndexPath])
//
//
//        }
//
//    }
    
//    @objc func scrollToCurrentMonth() {
//
//        let centerIndexPath = IndexPath(item: 1, section: 0)
//        self.calenderCollectionView.scrollToItem(at:centerIndexPath, at: .centeredHorizontally, animated: false)
//
//    }
    
//    private func changeMonthAndYear(_ centerMonth:Int) {
//
//        let monthStr = Month.January
//        self.customNaviView.yearAndMonth = self.centerDate.description
////            monthStr.strMonth(centerMonth)+" 2018"
//
//
//    }
    
    
    
    private func updateDatesArray(_ centerDate : Date,completion:(() ->Void)? = nil) {
        
        self.dates = []
        
        DispatchQueue.global().sync {
            
            let calendar = Calendar.current
            let presentDate = centerDate
            
            guard let oneMonthAgoDate = calendar.date(byAdding: .month, value: -1, to: presentDate) else { return }
            guard let oneMonthLaterDate = calendar.date(byAdding: .month, value: +1, to: presentDate) else { return }
            
            self.beforeDate = oneMonthAgoDate
            self.afterDate = oneMonthLaterDate
            
            let dateArray = [oneMonthAgoDate,presentDate,oneMonthLaterDate]
    
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

//MARK:- Actions
extension CalendarViewController {
    
    func setupActions() {
        
        let tapGeusture = UITapGestureRecognizer(target: self, action: #selector(showAndHideYearMenuTV))
        self.customNaviView.addGestureRecognizer(tapGeusture)
//        self.customNaviView.leftButton.addTarget(self, action: #selector(scrollToCurrentMonth), for: .touchUpInside)
//        self.yearMenuTableView.headerView.addTarget(self, action: #selector(test), for: .touchUpInside)
        
    }

    @objc func showAndHideYearMenuTV() {
        
        if yearMenuTableView.isShown {
            
            DispatchQueue.main.async {
                
                self.yearMenuTableView.snp.updateConstraints {
                    
                    $0.top.equalTo(self.customNaviView.snp.top).offset(0)
                    $0.height.equalTo(0)
                    
                }
                
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    self.yearMenuTableView.alpha = 0
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.yearMenuTableView.isShown = false
                })
            }
            
        } else {
            
            DispatchQueue.main.async {
                
                self.yearMenuTableView.snp.updateConstraints {
                    $0.top.equalTo(self.customNaviView.snp.top).offset(self.customNaviView.frame.height)
                    $0.height.equalTo(44*5)
                    
                }
                
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    self.yearMenuTableView.alpha = 0.95
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.yearMenuTableView.isShown = true
                })
            }
                
        }
    }

}














