//
//  UITableViewCell.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 6..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

class AirlineCell : UITableViewCell {
    
    var airlineViewModel : AirlineViewModel! {
        
        didSet {
            
            airlineLabel.text = airlineViewModel.name
            self.accessoryType = airlineViewModel.accessoryType
            
        }
        
    }
    
    let airlineLabel = UILabel().then {
        
        $0.text = "AirLine"
        $0.textColor = .black
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initialize() {
        
        contentView.addSubview(airlineLabel)
        
        airlineLabel.snp.makeConstraints{
            
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            
        }
    
    }
    
    
    

    
}


extension AirlineCell {
    
}
