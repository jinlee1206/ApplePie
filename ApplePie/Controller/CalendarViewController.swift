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
import RJExtension


class CalendarViewController : UIViewController {
    
    // UI
    
    lazy var dayStackView : UIStackView = {
        
         let sv = UIStackView(arrangedSubviews:createDayLabel("M","T","W","T","F","S","S"))
         sv.axis = .horizontal
         sv.distribution = .fillEqually
        
        return sv
    }()
    
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
        
    }()
    
    let customNaviView = CustomNaviView()
    
    // Data

}


//MARK:- Life Cycle
extension CalendarViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavi()
        setupViews()
        
    }
    
}


//MARK:- Setup Navi & Views
extension CalendarViewController {
    
    private func setupNavi() {
        
        navigationItem.title = "2018"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func setupViews() {
        
        [
            
            collectionView,
            dayStackView,
            customNaviView
        
        ].forEach({view.addSubview($0)})
        
        customNaviView.snp.makeConstraints {
            
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(56)
            
        }
        
        dayStackView.snp.makeConstraints {
            $0.top.equalTo(self.customNaviView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        
        collectionView.snp.makeConstraints {
            
            $0.top.equalTo(self.dayStackView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        setupCollectionView()
    
    }
    
    private func createDayLabel(_ named:String...) -> [UILabel] {
        
        return named.map { name in
            
            let label = UILabel()
            var textColor = UIColor.black
            textColor = name == "S" ? .red : .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = name
            label.font = UIFont.preferredFont(forTextStyle: .headline)
            label.textAlignment = .center
            label.textColor = textColor
            return label
        }
        
    }
    
    private func setupCollectionView() {
        
        self.collectionView.registerCell(ofType: CalendarCell.self)
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    

    
}


//MARK:- UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension CalendarViewController : UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(with: CalendarCell.self, for: indexPath)
        cell.dateLabel.text = (indexPath.item+1).description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = Int(self.view.frame.width/7)
        
        return CGSize(width: size, height: size)
    }

}

extension CalendarViewController {
    
}

//MARK:-
extension CalendarViewController {
    
}












