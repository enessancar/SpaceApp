//
//  GFButton.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit

final class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(title: String, backgroundColor: UIColor) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
    }
    
    private func configure() {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = .cornerRadius
        titleLabel?.font = .boldSystemFont(ofSize: .title1)
    }
}
