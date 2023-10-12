//
//  UIHelper.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit

enum UIHelper {
    
    static func createHomeCompositionLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1 / 7)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = .ma
    }
}
