//
//  SecondViewController.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 3..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Then
import SnapKit

class SecondViewController : UIViewController {
    
    let collectionView = UICollectionView().then {
        
        let layout = UICollectionViewFlowLayout()
        
        $0.collectionViewLayout = layout
        $0.backgroundColor = .white

    }
    
    
    
}


//MARK: Life Cycle
extension SecondViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
