//
//  ViewController.swift
//  CompositionalLayoutTest
//
//  Created by 董 亜飛 on 2022/12/19.
//

import UIKit

class ViewController: UIViewController {
    private var sections: [Section] = [BannerSection(), ItemSection()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let compositionalLayout = UICollectionViewCompositionalLayout { [weak self] section, _ in
            return self?.sections[section].layoutSection(self?.view ?? .init())
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collectionView.register(type: BannerCell.self)
        collectionView.register(type: ItemCell.self)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView, at: indexPath)
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectItem(self, at: indexPath)
    }
}
