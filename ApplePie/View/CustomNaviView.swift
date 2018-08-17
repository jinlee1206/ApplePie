//
//  CustomNaviView.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 8..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit



class CustomNaviView : UIView {
    
    var yearAndMonth : String? {
        
        didSet {
            
            yearAndMonthLabel.text = self.yearAndMonth
            
        }
        
    }
    
    let leftButton : UIButton = {
        let b = UIButton()
        b.setTitle("뒤로", for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        
        return b
    }()

    let yearAndMonthLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.preferredFont(forTextStyle: .headline)
        l.text = "August 2018"
        
        return l
    }()
    
    let rightButton : UIButton = {
        let b = UIButton()
        b.setTitle("앞으로", for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomNaviView {
    
    private func setupViews() {
        
        [
            leftButton,
            yearAndMonthLabel,
            rightButton
            
        ].forEach {self.addSubview($0)}
        
        
        leftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
        }
        
        yearAndMonthLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        
    
    }
    
}
