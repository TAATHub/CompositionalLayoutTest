//
//  UICollectionView+Extensions.swift
//  CompositionalLayoutTest
//
//  Created by 董 亜飛 on 2022/12/19.
//

import UIKit

extension UICollectionView {
    func registerFromNib<T: UICollectionViewCell>(type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func register<T: UICollectionViewCell>(type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: type.className)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
