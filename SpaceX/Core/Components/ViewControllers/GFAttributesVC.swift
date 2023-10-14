//
//  GFAttributesVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 14.10.2023.
//

import UIKit
import SnapKit

final class GFAttributesVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private let launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createAttributesFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.dataSource = self 
        collectionView.register(AttributeCell.self, forCellWithReuseIdentifier: AttributeCell.identifier)
        collectionView.isUserInteractionEnabled = false
        
        collectionView.backgroundColor = .systemBackground
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - CollectionView
extension GFAttributesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttributeCell.identifier, for: indexPath) as? AttributeCell else {
            fatalError()
        }
        let attribute = launch._attributeNames[indexPath.item]
        let value = launch._attributeValues[indexPath.item]
        cell.setup(attribute: attribute, value: value)
        return cell
    }
}
