//
//  TitleLabel.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit

final class GFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        
        self.text = text
        self.textAlignment = textAlignment
        self.font = .boldSystemFont(ofSize: fontSize)
    }
    
    private func configure() {
        numberOfLines = 1
        textColor = .black
        
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        
        lineBreakMode = .byTruncatingTail
    }
}
