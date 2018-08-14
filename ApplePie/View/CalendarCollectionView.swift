//
//  CalenderCollectionView.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 14..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import RJExtension


class CalendarCollectionView : UICollectionView {
    
    
    var dates = [[String]]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame:frame, collectionViewLayout: UICollectionViewFlowLayout())
        
        
        self.backgroundColor = .white
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCollectionView() {
        
        self.registerCell(ofType: DateCell.self)
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        
    }
    
}

extension CalendarCollectionView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.dequeueReusableCell(with: DateCell.self, for: indexPath)
        cell.dateLabel.text = indexPath.item.description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = self.frame.width/7
        

        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    
    private func reloadCalendarCV() {
        
        DispatchQueue.main.async {
            self.reloadData()
        }
        
    }

}

