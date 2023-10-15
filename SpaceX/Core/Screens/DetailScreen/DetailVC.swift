//
//  DetailVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 15.10.2023.
//

import UIKit
import SnapKit

final class DetailVC: UIViewController {
    
    private var scrollView: UIScrollView!
    private var stackView: UIStackView!
    private var launchHeaderView: LaunchHeaderView!
    private var pastLaunchDateView: PastLaunchDateView!
    
    private var attributesView: UIView!
    private var linksView: UIView!
    private var upcomingDateView: UIView!
    
    let launch: Launch
    init(launch: Launch) {
        self.launch = launch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        configureScrollView()
        configureStackView()
        configureLaunchHeaderView()
        
        if launch.upcoming == true {
            configureUpcomingDateView()
        } else {
            configurePastLaunchDateView()
        }
        configureAttributesView()
        configureLinksView()
    }
}

//MARK: - UI Configurations
extension DetailVC {
    private func configureVC() {
        view.backgroundColor = .systemBackground
        title = (launch.upcoming ?? false) ? "Launches Upcoming" : "Launches Past"
    }
    
    private func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureStackView() {
        stackView = GFStackView(axis: .vertical)
        scrollView.addSubview(stackView)
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 10, left: 0, bottom: 10, right: 0)
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView).multipliedBy(0.9)
            make.centerX.equalTo(scrollView.snp.centerX)
        }
    }
    
    private func configureLaunchHeaderView() {
        launchHeaderView = LaunchHeaderView()
        stackView.addArrangedSubview(launchHeaderView)
        
        launchHeaderView.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
            make.height.equalTo(CGFloat.itemHeight)
        }
        launchHeaderView.setup(launc: launch)
        
        if launch.upcoming == false {
            stackView.setCustomSpacing(8, after: launchHeaderView)
        }
    }
    
    private func configurePastLaunchDateView() {
        pastLaunchDateView = PastLaunchDateView()
        stackView.addArrangedSubview(pastLaunchDateView)
        
        pastLaunchDateView.setup(launch: launch)
        pastLaunchDateView.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
        }
    }
    
    private func configureAttributesView() {
        attributesView = UIView()
        stackView.addArrangedSubview(attributesView)
        
        attributesView.snp.makeConstraints { make in
            make.height.equalTo(CGFloat.attributesViewHeight)
            make.width.equalToSuperview()
        }
        
        add(childVC: GFAttributesVC(launch: launch), containerView: attributesView)
    }
    
    private func configureLinksView() {
        linksView = UIView()
        stackView.addArrangedSubview(linksView)
        
        let linksViewHeight = (4 * CGFloat.itemHeight) + (3 * CGFloat.margin)
        
        linksView.snp.makeConstraints { make in
            make.height.equalTo(linksViewHeight)
            make.width.equalToSuperview()
        }
        
        add(childVC: GFLinksVC(launch: launch), containerView: linksView)
    }
    
    private func configureUpcomingDateView() {
        upcomingDateView = UIView(frame: .zero)
        stackView.addArrangedSubview(upcomingDateView)
        
        upcomingDateView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(CGFloat.upcomingDateHeight)
        }
        add(childVC: UpcomingDateVC(launch: launch), containerView: upcomingDateView)
    }
}
