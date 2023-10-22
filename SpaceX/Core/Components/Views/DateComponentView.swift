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
        
        configureContainerStackView()
        configureComponentStackView()
        configureValueLabel()
        configureComponentLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(component: String, showColon: Bool = false) {
        self.init(frame: .zero)
        
        componentLabel.text = component
        
        guard showColon else { return }
        configureColonLabel()
    }
    
    func setup(value: String) {
        valueLabel.text = value
    }
    
    private func configureContainerStackView() {
        containerStackView = GFStackView(axis: .horizontal)
        addSubview(containerStackView)
        
        containerStackView.spacing = 8
        containerStackView.alignment = .top
        
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureComponentStackView() {
        componentStackView = GFStackView(axis: .vertical)
        containerStackView.addArrangedSubview(componentStackView)
        
        componentStackView.spacing = 2
        componentStackView.alignment = .leading
    }
    
    private func configureValueLabel() {
        valueLabel = GFTitleLabel(text: "", textAlignment: .left, fontSize: .title1)
        componentStackView.addArrangedSubview(valueLabel)
        
        valueLabel.textColor = .white
    }
    
    private func configureComponentLabel() {
        componentLabel = GFBodyLabel(text: "", textAlignment: .left, fontSize: .caption)
        componentStackView.addArrangedSubview(componentLabel)
        
        componentLabel.textColor = .white
    }
    
    private func configureColonLabel() {
        colonLabel = GFTitleLabel(text: ":", textAlignment: .left, fontSize: .title1)
        containerStackView.addArrangedSubview(colonLabel)
        
        colonLabel.textColor = .white
    }
}
