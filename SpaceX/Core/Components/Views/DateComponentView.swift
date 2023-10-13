//
//  DateComponentView.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit
import SnapKit

final class DateComponentView: UIView {
    
    private var containerStackView: GFStackView!
    private var componentStackView: GFStackView!
    private var valueLabel: GFTitleLabel!
    private var componentLabel: GFBodyLabel!
    private var colonLabel: GFTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(component: String, showColon: Bool = false) {
        self.init(frame: .zero)
    }
}
