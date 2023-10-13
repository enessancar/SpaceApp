//
//  LinkItemView.swift
//  SpaceX
//
//  Created by Enes Sancar on 13.10.2023.
//

import UIKit
import SnapKit

final class LinkItemView: UIView {
    
    private var imageView: GFImageView!
    private var titleLabel: GFTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureImageView()
        configureTitleLabel()
        showDisclosureIndicator(size: .indicatorSize, tintColor: .secondaryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(systemName: String, title: String) {
        self.init(frame: .zero)
        
        imageView.image = UIImage(systemName: systemName)
        titleLabel.text = title
    }
    
    private func configure() {
        layer.cornerRadius = .cornerRadius
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureImageView() {
        imageView = GFImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.backgroundColor = .clear
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(2 * .padding)
            make.height.width.equalTo(CGFloat.imageSize)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = GFTitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.leading.equalTo(imageView.snp.trailing).offset(2 * .padding)
        }
    }
}
