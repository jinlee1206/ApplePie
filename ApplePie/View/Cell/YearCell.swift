//
//  YearCell.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 9..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import RJExtension


class YearCell : BasicTableViewCell {
    
    let yearLabel : UILabel = {
        
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.preferredFont(forTextStyle: .headline)
        l.text = "2018"
        
        return l
    }()
    
    override func initial() {
        super.initial()
        
        self.contentView.addSubview(yearLabel)
        
        self.yearLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }
    
    
}

extension YearCell {
    
}
