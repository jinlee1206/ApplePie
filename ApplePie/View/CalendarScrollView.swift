//
//  CalendarScrollView.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 14..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import RJExtension


class CalendarScrollView : UIScrollView {
    
    let pastDateCV = CalendarCollectionView()
    let presentDateCV = CalendarCollectionView()
    let futureDateCV = CalendarCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isPagingEnabled = true
        self.delegate = self
        self.backgroundColor = .white
        self.showsHorizontalScrollIndicator = false
        self.contentSize.width = UIScreen.main.bounds.width * 3
        setupScrollView()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
    }
}


//MARK:- Setup Views
extension CalendarScrollView {
    
    private func setupScrollView() {
    
        pastDateCV.backgroundColor = .red
        presentDateCV.backgroundColor = .blue
        futureDateCV.backgroundColor = .green
        let collectionViews = [pastDateCV,presentDateCV,futureDateCV]
        print("frame:",self.frame.height)
        for i in 0..<collectionViews.count {
            
            
            var frame = CGRect()
            frame.origin.x = UIScreen.main.bounds.width * CGFloat(i)
            frame.origin.y = 0
            let size = UIScreen.main.bounds.width
            frame.size = CGSize(width: size, height:size-(size/7))
            let layout = UICollectionViewFlowLayout()
            collectionViews[i].frame = frame
            collectionViews[i].collectionViewLayout = layout

            self.addSubview(collectionViews[i])

        }
    }
}

extension CalendarScrollView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let X = scrollView.contentOffset.x
        print(X)
        print("self",self.frame.size.width)
        print("scrollView",scrollView.frame.size.width)
        if X > 0 {
            
            if X > scrollView.frame.size.width * 2 {
//                print(scrollView.frame.size.width)
                self.contentOffset = CGPoint(x: 0 , y: 0)
            }
            
        } else if X < 0 {
//                print(scrollView.frame.size.width)
            self.contentOffset = CGPoint(x: scrollView.frame.size.width * 2, y: 0)
            
        }

    }

//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//
//        let x = scrollView.contentOffset.x
//        let contentWidth = scrollView.frame.size.width
//        let indexPathItem = Int(x/contentWidth)
//        print(indexPathItem)
//        //        indexPathItem == 0 ? insertAndDeleteCell(direction: .LEFT) : insertAndDeleteCell(direction: .RIGHT)
//
//    }
    
}


