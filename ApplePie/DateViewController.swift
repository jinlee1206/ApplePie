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

        self.calenderCollectionView.registerCell(ofType: CalendarCell.self)
        self.calenderCollectionView.backgroundColor = .white
        self.calenderCollectionView.delegate = self
        self.calenderCollectionView.dataSource = self
        
    }
    
}


//MARK:
extension DateViewController : UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    private func reloadCalendarCV() {
        
        DispatchQueue.global().async {
            self.calenderCollectionView.reloadData()
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.calenderCollectionView.dequeueReusableCell(with: CalendarCell.self, for: indexPath)
//        cell.dates = self.dates[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    
    //    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    //
    //        let x = scrollView.contentOffset.x
    //        let contentWidth = scrollView.frame.size.width
    //        let indexPathItem = Int(x/contentWidth)
    //        print(indexPathItem)
    //        indexPathItem == 0 ? insertAndDeleteCell(direction: .LEFT) : insertAndDeleteCell(direction: .RIGHT)
    //
    //    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let x = scrollView.contentOffset.x
        let contentWidth = scrollView.frame.size.width
        let indexPathItem = Int(x/contentWidth)
        print(indexPathItem)
//        indexPathItem == 0 ? insertAndDeleteCell(direction: .LEFT) : insertAndDeleteCell(direction: .RIGHT)
        
        
        
    }
    
}
