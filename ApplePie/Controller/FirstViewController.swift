//
//  ViewController.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 3..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit




class FirstViewController: UIViewController {
    
    let tableView = UITableView().then {
        
        $0.backgroundColor = .white
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }



}


// Life Cycle
extension FirstViewController {

    private func setupViews() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        }
        
        
    }
    
}

extension FirstViewController {
    
}

