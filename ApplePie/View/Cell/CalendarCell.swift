//
//  UITableViewCell.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 6..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import RJExtension


class CalendarCell : BasicCollectionViewCell {
    
    var dates = [String]() {

        didSet {

            self.dateCollectionView.reloadData()

        }

    }
    
    
    let dateCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = false
        cv.allowsSelection = true
        cv.backgroundColor = .white
        return cv
        
    }()
    
    override func initial() {
        super.initial()
        
        setupViews()
        setupDateCollectionView()
        
    }

}


//MARK:- setupViews
extension CalendarCell {
    
    func getDayOfWeek(weekday:Int) -> String {
        if(weekday == 1) {
            return "Sunday"
        }
        else if(weekday == 2) {
            return "Monday"
        }
        else if(weekday == 3) {
            return "Tuesday"
        }
        else if(weekday == 4) {
            return "Wednesday"
        }
        else if(weekday == 5) {
            return "Thursday"
        }
        else if(weekday == 6) {
            return "Friday"
        }
        else {
            return "Saturday"
        }
        
    }
    
    private func setupViews() {
        
        contentView.addSubview(dateCollectionView)
        dateCollectionView.snp.makeConstraints({
            
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        })
        
    }
    
    private func setupDateCollectionView() {
        
        self.dateCollectionView.delegate = self
        self.dateCollectionView.dataSource = self
        self.dateCollectionView.registerCell(ofType: DateCell.self)

    }
    
}


//MARK:- UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension CalendarCell : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dates.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.dateCollectionView.dequeueReusableCell(with: DateCell.self, for: indexPath)
        cell.date = self.dates[indexPath.item]
    
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = self.frame.width/7
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
