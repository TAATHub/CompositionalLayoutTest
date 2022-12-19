//
//  Section.swift
//  CompositionalLayoutTest
//
//  Created by 董 亜飛 on 2022/12/19.
//

import UIKit

protocol Section {
    // セクションのアイテム数
    var numberOfItems: Int { get }

    // レイアウトの生成
    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection

    // セルの生成
    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    
    // セルタップ時
    func selectItem(_ controller: UIViewController, at indexPath: IndexPath)
}
