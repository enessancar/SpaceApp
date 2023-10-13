//
//  GFAlertVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 13.10.2023.
//

import UIKit
import SnapKit

final class GFAlertVC: UIViewController {
    
    private var containerView: GFAlertContainerView!
    private var titleLabel: GFTitleLabel!
    private var bodyLabel: GFBodyLabel!
    private var actionButton: GFButton!
    
    private let alertTitle: String
    private let alertBody: String
    private let alertButtonTitle: String
    
    init(alertTitle: String, alertBody: String, alertButtonTitle: String) {
        self.alertTitle = alertTitle
        self.alertBody = alertBody
        self.alertButtonTitle = alertButtonTitle
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.7)
        
        configureContainerView()
        configureTitleLabel()
        configureBodyLabel()
        configureActionButton()
    }
    
    private func configureContainerView() {
        containerView = GFAlertContainerView(frame: .zero)
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = GFTitleLabel(text: alertTitle, textAlignment: .center, fontSize: .largeTitle)
        containerView.addArrangedSubview(titleLabel)
    }
    
    private func configureBodyLabel() {
        bodyLabel = GFBodyLabel(text: alertBody, textAlignment: .center, fontSize: .title1)
        containerView.addArrangedSubview(bodyLabel)
        
        bodyLabel.numberOfLines = 15
    }
    
    private func configureActionButton() {
        actionButton = GFButton(title: alertButtonTitle, backgroundColor: .systemRed)
        containerView.addArrangedSubview(actionButton)
        
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(containerView.snp.width).multipliedBy(0.15)
        }
        
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc private func actionButtonTapped() {
        self.dismiss(animated: true)
    }
}
