//
//  AttributeCell.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit
import SnapKit

final class AttributeCell: UICollectionViewCell {
    static let identifier = "AttributeCell"
    
    private var stackView: GFStackView!
    private var attributeLabel: GFBodyLabel!
    private var valueLabel: GFTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureStackView()
        configureAttributeLabel()
        configureValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup(attribute: String, value: String) {
        attributeLabel.text = attribute
        valueLabel.text = value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        attributeLabel.text = nil
        valueLabel.text = nil
    }
    
    private func configure() {
        layer.cornerRadius = .cornerRadius
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureStackView() {
        stackView = GFStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = 2
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(2 * CGFloat.padding)
            make.trailing.equalToSuperview().offset( -2 * CGFloat.padding)
        }
    }
    
    private func configureAttributeLabel() {
        attributeLabel = GFBodyLabel(text: "", textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(attributeLabel)
    }
    
    private func configureValueLabel() {
        valueLabel = GFTitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        stackView.addArrangedSubview(valueLabel)
    }
}
