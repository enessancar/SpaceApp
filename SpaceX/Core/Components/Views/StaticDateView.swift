//
//  StaticDateView.swift
//  SpaceX
//
//  Created by Enes Sancar on 13.10.2023.
//

import UIKit
import SnapKit

final class StaticDateView: UIView {
    
    private var stackView: GFStackView!
    private var titleLabel: GFTitleLabel!
    private var dateLabel: GFBodyLabel!
    
    private let launch: Launch
    init(launch: Launch) {
        self.launch = launch
        super.init(frame: .zero)
        
        configureStackView()
        configureTitleLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        stackView = GFStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = 2
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = GFTitleLabel(text: "LAUNCH DATE", textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(titleLabel)
        
        titleLabel.textColor = .white
    }
    
    private func configureDateLabel() {
        dateLabel = GFBodyLabel(text: launch._launchDate, textAlignment: .left, fontSize: .caption)
        stackView.addArrangedSubview(dateLabel)
        
        dateLabel.textColor = .white
    }
}
