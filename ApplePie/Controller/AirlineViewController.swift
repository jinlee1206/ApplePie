//
//  AirlineViewController.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 6..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import Then
import SnapKit
import UIKit


class AirLineViewController : UIViewController {
    
    let airlineArray = ["대한항공","아시아나","진에어","이스타","제주항공","에어부산","티웨이항공"]
    let airlineTableView = UITableView()
    var airlineViewModels = [AirlineViewModel]()

}

extension AirLineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
        fetchData()
    }
    
}


//MARK:- Setup Layout
extension AirLineViewController {
    
    private func setupViews() {
        
        view.addSubview(airlineTableView)
        
        airlineTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
   
    }
    
    private func fetchData() {
        
        for i in airlineArray {
            
            let airlineModel = AirlineModel(name:i)
            let airlineViewModel = AirlineViewModel(airline: airlineModel)
            self.airlineViewModels.append(airlineViewModel)
            
        }
        
        
        
    }
    
}


//MARK:- UITableViewDelegate , UITableViewDataSource
extension AirLineViewController : UITableViewDelegate , UITableViewDataSource {
    
    private func setupTableView() {
        
        self.airlineTableView.backgroundColor = .white
        self.airlineTableView.delegate = self
        self.airlineTableView.dataSource = self
        self.airlineTableView.registerCell(ofType:AirlineCell.self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return airlineArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = airlineTableView.dequeueCell(ofType:AirlineCell.self, indexPath: indexPath)
        cell.airlineViewModel = airlineViewModels[indexPath.row]
        return cell
        
    }
    
}












