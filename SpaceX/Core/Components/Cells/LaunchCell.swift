//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Enes Sancar on 14.10.2023.
//

import UIKit
import SnapKit

final class LaunchCell: UICollectionViewCell {
    static let identifier = "LaunchCell"
    
    private var imageView: GFImageView!
    private var stackView: GFStackView!
    private var nameLabel: GFTitleLabel!
    private var dateLabel: GFBodyLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        congfigureImageView()
        configureStackView()
        configureNameLabel()
        configureDateLabel()
        
        showDisclosureIndicator(size: .indicatorSize, tintColor: .secondaryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup(launch: Launch) {
        nameLabel.text = launch._name
        dateLabel.text = launch._launchDate
        
        if let urlString = launch.links?.patch?.small {
            imageView.download(urlString: urlString)
        } else {
            imageView.image = .no
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        dateLabel.text = nil
        imageView.image = nil
        imageView.cancelDownloading()
    }
    
    private func configure() {
        backgroundColor = .secondaryLabel
        
        layer.cornerRadius = .cornerRadius
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func congfigureImageView() {
        imageView = GFImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(2 * CGFloat.padding)
            make.width.height.equalTo(snp.height).multipliedBy(0.7)
        }
    }
    
    private func configureStackView() {
        stackView = GFStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = .padding / 2
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(2 * CGFloat.padding)
            make.trailing.equalToSuperview().offset(-2 * CGFloat.padding)
        }
    }
    
    private func configureNameLabel() {
        nameLabel = GFTitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        stackView.addArrangedSubview(nameLabel)
    }
    
    private func configureDateLabel() {
        dateLabel = GFBodyLabel(text: "", textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(dateLabel)
    }
}
