//
//  ClassNameProtocol.swift
//  CompositionalLayoutTest
//
//  Created by 董 亜飛 on 2022/12/19.
//

import UIKit

protocol ClassNameProtocol {
    
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
