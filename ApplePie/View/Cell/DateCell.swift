//
//  DateCell.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 9..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import RJExtension

class DateCell : BasicCollectionViewCell {
    
    var date : String? {
        didSet {
            dateLabel.text = date
        }
        
    }
    
    let dateLabel : UILabel = {
        
        let l = UILabel()
        l.textAlignment = .center
        
        return l
    }()
    
    override func initial() {
        super.initial()
        
        setupViews()
    }
    
}



extension DateCell {
    
    private func setupViews() {
        
        self.contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        }
    }
    
    
}
