//
//  YearTableView.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 9..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import RJExtension


class YearMenuTableView : UITableView {
    
    let sampleYearArray = ["2018"]
    
    var isShown = false
    
    let headerView = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 32))
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        
        setupHeaderView()
        
        self.registerCell(ofType: YearCell.self)
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.tableHeaderView = self.headerView
        self.isScrollEnabled = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK:- UITableViewDelegate & UITableViewDataSource
extension YearMenuTableView : UITableViewDelegate , UITableViewDataSource {
    
    private func setupHeaderView() {
        
        self.headerView.setImage(UIImage(named: "plus"), for: .normal)
        self.headerView.imageView?.contentMode = .scaleAspectFit
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleYearArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.dequeueCell(ofType: YearCell.self, indexPath: indexPath)
        cell.yearLabel.text = sampleYearArray[indexPath.row]
        return cell
    }
    
}

extension YearMenuTableView {
    
}
