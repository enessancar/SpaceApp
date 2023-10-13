//
//  PastLaunchDateView.swift
//  SpaceX
//
//  Created by Enes Sancar on 13.10.2023.
//

import UIKit
import SnapKit

final class PastLaunchDateView: UIView {
    
    private var prefixLabel: GFBodyLabel!
    private var dateLabel: GFTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurePrefixLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup(launch: Launch) {
        dateLabel.text = launch._launchDate
    }
    
    private func configurePrefixLabel() {
        prefixLabel = GFBodyLabel(text: "Launch Date:", textAlignment: .left, fontSize: .title2)
        addSubview(prefixLabel)
        
        let width = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8PlusZoomed ? 76 : 100
        prefixLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(width)
        }
    }
    
    private func configureDateLabel() {
        dateLabel = GFTitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(prefixLabel.snp.trailing).offset(4)
        }
    }
}
