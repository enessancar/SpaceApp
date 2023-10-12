//
//  GFStackView.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit

final class GFStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        self.axis = axis
    }
    
    private func configure() {
        axis = .vertical
        spacing = 3 * .padding
        distribution = .fill
        alignment = .center
    }
}
