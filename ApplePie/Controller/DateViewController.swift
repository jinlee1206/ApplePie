//
//  DateViewController.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 13..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import RJExtension


class DateViewController : UIViewController {
    
    var dates = [String]() {
        didSet{
            
            reloadCalendarCV()
            
        }
        
    }
    
    let calenderCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.allowsSelection = false
        
        
        return cv
        
    }()
    
}

extension DateViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        setupCollectionView()
    }
    
}

extension DateViewController {
    
    private func setupCollectionView() {
        
        self.view.addSubview(calenderCollectionView)
        
        calenderCollectionView.snp.makeConstraints {
            
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        }

        self.calenderCollectionView.registerCell(ofType: DateCell.self)
        self.calenderCollectionView.backgroundColor = .white
        self.calenderCollectionView.delegate = self
        self.calenderCollectionView.dataSource = self
        
    }
    
}


//MARK: UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension DateViewController : UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.calenderCollectionView.dequeueReusableCell(with: DateCell.self, for: indexPath)
        cell.date = self.dates[indexPath.item]                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.width/7
        return CGSize(width: size, height: size)
    }
    
    private func reloadCalendarCV() {
        
        DispatchQueue.main.async {
            self.calenderCollectionView.reloadData()
        }
        
    }
    
    
}
