//
//  LaunchHeaderView.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit
import SnapKit

final class LaunchHeaderView: UIView {
    
    private var imageView: GFImageView!
    private var launchName: GFTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
        configureLaunchNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup(launc: Launch) {
        launchName.text = launc._name
        
        if let urlString = launc.links?.patch?.small {
            imageView.download(urlString: urlString)
        } else {
            imageView.image = .no
        }
    }
    
    private func configureImageView() {
        imageView = GFImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
    }
    
    private func configureLaunchNameLabel() {
        launchName = GFTitleLabel(text: "", textAlignment: .left, fontSize: .largeTitle)
        addSubview(launchName)
        
        launchName.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(2 * CGFloat.padding)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
