//
//  ItemSection.swift
//  CompositionalLayoutTest
//
//  Created by 董 亜飛 on 2022/12/19.
//

import UIKit

struct ItemSection: Section {
    var numberOfItems: Int {
        return 10
    }
    
    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        ))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .absolute(120),
            heightDimension: .absolute(120)
        ), subitems: [item])
        group.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = view.dequeueReusableCell(with: ItemCell.self, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func selectItem(_ controller: UIViewController, at indexPath: IndexPath) {
        NSLog("selected item at section%d row%d", indexPath.section, indexPath.row)
    }
}
