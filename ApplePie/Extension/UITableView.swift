//
//  UITableView.swift
//  ApplePie
//
//  Created by Euijae Hong on 2018. 8. 6..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import Foundation
import UIKit



public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    
    public static var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}




extension UITableView {
    
    public func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.className)
        
    }
    
    public func dequeueCell<T: UITableViewCell>(ofType type: T.Type , indexPath :IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
        
    }
    
}
