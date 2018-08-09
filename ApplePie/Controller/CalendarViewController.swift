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


class CalendarViewController : UIViewController {
    
    // UI
    
    var dates = [[String]]()
    let yearMenuTableView = YearMenuTableView()
    let customNaviView = CustomNaviView()
    lazy var dayStackView : UIStackView = {
        
         let sv = UIStackView(arrangedSubviews:createDayLabel("S","M","T","W","T","F","S"))
         sv.axis = .horizontal
         sv.distribution = .fillEqually
        
        return sv
    }()
    
    let calenderCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.allowsSelection = false
        
        return cv
        
    }()
    
    
    
    // Data
    
    
    

}


//MARK:- Life Cycle
extension CalendarViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        setupViews()
        setupActionForButton()
        
        getAllDate {
            
            self.calenderCollectionView.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}


//MARK:- SetupViews
extension CalendarViewController {
    

    private func setupViews() {
        
        [
            
            dayStackView,
            calenderCollectionView,
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
        
        
        calenderCollectionView.snp.makeConstraints {
            
            $0.top.equalTo(self.dayStackView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        setupCollectionView()
    
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

    
    private func setupCollectionView() {
        
        self.calenderCollectionView.registerCell(ofType: CalendarCell.self)
        self.calenderCollectionView.backgroundColor = .white
        self.calenderCollectionView.delegate = self
        self.calenderCollectionView.dataSource = self
        
    }
    
}


//MARK:- UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension CalendarViewController : UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.calenderCollectionView.dequeueReusableCell(with: CalendarCell.self, for: indexPath)
        cell.dates = self.dates[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        

        let x = scrollView.contentOffset.x
        let contentWidth = scrollView.frame.size.width
        let indexPathItem = Int(x/contentWidth)
        
        changeMonthAndYear(indexPathItem)
    
    }
    


}



//MARK:- Private Func
extension CalendarViewController {
    
    @objc func scrollToCurrentMonth() {
        
        let currentMonth = Date.currentMonth()
        let indexPathItem = Int(currentMonth)!-1
        let indexPath = IndexPath(item: indexPathItem, section: 0)
        self.calenderCollectionView.scrollToItem(at:indexPath, at: .centeredHorizontally, animated: true)
        changeMonthAndYear(indexPathItem)
        
    }
    
    private func changeMonthAndYear(_ indexPathItem:Int) {
        
        let monthStr = Month.January
        self.customNaviView.yearAndMonth = monthStr.strMonth(indexPathItem)+" 2018"
  
    }
    
    private func getAllDate(completion:(() ->Void)? = nil) {
        
        DispatchQueue.global().sync {
            
            for i in 1...12 {
                
                let days = Date.days(year:2018 , month: i)
                self.dates.append(days)
                print("\(i)월",days)
            }
            
            completion?()
        }
        
    
    }
    
}

//MARK:- Actions
extension CalendarViewController {
    
    func setupActionForButton() {
        
        let tapGeusture = UITapGestureRecognizer(target: self, action: #selector(showAndHideYearMenuTV))
        self.customNaviView.addGestureRecognizer(tapGeusture)
        self.customNaviView.leftButton.addTarget(self, action: #selector(scrollToCurrentMonth), for: .touchUpInside)
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














