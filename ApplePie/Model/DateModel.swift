//
//  DateModel.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 9..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

struct DateModel {
    
    let year : String
    let month : String
    let date : [String]
    
    
    init(date:Date) {
        
        self.year = ""
        self.month = ""
        self.date = [String]()
        
    }

}
