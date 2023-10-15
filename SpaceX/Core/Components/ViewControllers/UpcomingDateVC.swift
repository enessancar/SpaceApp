//
//  UpcomingDateVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 14.10.2023.
//

import UIKit
import SnapKit

final class UpcomingDateVC: UIViewController {
    
    private var timer: Timer?
    private var staticDateView: StaticDateView!
    
    private var componentsStackView: GFStackView!
    private var hourComponent = DateComponentView(component: "Hour", showColon: true)
    private var minuteComponent = DateComponentView(component: "Minute", showColon: true)
    private var secondComponent = DateComponentView(component: "Second")
    
    private lazy var unix = launch._dateUnix
    private let launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        
        configureTimer()
        configureStaticDateView()
        configureComponentStackView()
        configureComponent()
    }
    
    private func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self else { return }
            
            self.unix -= 1
            
            let hour = self.unix.unixToDate().getComponentValue(.hour)
            let minute = self.unix.unixToDate().getComponentValue(.minute)
            let second = self.unix.unixToDate().getComponentValue(.second)
            
            self.hourComponent.setup(value: hour)
            self.minuteComponent.setup(value: minute)
            self.secondComponent.setup(value: second)
        })
    }
    
    private func configureStaticDateView() {
        staticDateView = StaticDateView(launch: launch)
        view.addSubview(staticDateView)
        
        staticDateView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureComponentStackView() {
        componentsStackView = GFStackView(axis: .horizontal)
        view.addSubview(componentsStackView)
        
        componentsStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset( -2 * CGFloat.padding)
        }
    }
    
    private func configureComponent() {
        let components = [hourComponent, minuteComponent, secondComponent]
        
        for component in components {
            componentsStackView.addArrangedSubview(component)
        }
        
        hourComponent.setup(value: unix.unixToDate().getComponentValue(.hour))
        minuteComponent.setup(value: unix.unixToDate().getComponentValue(.minute))
        secondComponent.setup(value: unix.unixToDate().getComponentValue(.second))
    }
}
