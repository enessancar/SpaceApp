//
//  GFAlertContainerView.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit

final class GFAlertContainerView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        axis = .vertical
        
        spacing = 2 * .padding
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 2 * CGFloat.padding, left: 2 * CGFloat.padding, bottom: 2 * CGFloat.padding, right: 2 * CGFloat.padding)
        
        backgroundColor = .white
        layer.cornerRadius = .cornerRadius
    }
}
