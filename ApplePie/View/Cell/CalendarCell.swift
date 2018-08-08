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
    
    let dateLabel = UILabel().then{
        
        $0.font = UIFont.preferredFont(forTextStyle: .body)
        $0.text = "1"
        $0.textAlignment = .center
        
    }
    
    override func initial() {
        super.initial()
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints({
            
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            
        })
        
    }

}
