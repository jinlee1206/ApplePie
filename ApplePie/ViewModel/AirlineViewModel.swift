//
//  AirlineViewModel.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 6..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit


struct AirlineViewModel  {
    
    let name : String
    let accessoryType : UITableViewCellAccessoryType
    
    init(airline:AirlineModel) {
        
        self.name = airline.name
        self.accessoryType = .detailButton
    }
    
}
