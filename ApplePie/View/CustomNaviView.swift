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
    
    let leftButton = UIButton().then {
        $0.setTitle("뒤로", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    let yearAndMonthLabel = UILabel().then {
        $0.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.text = "August 2018"
        
    }
    
    let rightButton = UIButton().then {
        $0.setTitle("앞으로", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        self.backgroundColor = .red
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
