//
//  GFLinksVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 14.10.2023.
//

import UIKit
import SnapKit

final class GFLinksVC: UIViewController {
    
    private let youtubeItemView = LinkItemView(systemName: SFSymbols.youtube, title: "Youtube")
    private let presskitItemView = LinkItemView(systemName: SFSymbols.presskit, title: "PressKit")
    private let articleItemView = LinkItemView(systemName: SFSymbols.article, title: "Article")
    private let wikipediaItemView = LinkItemView(systemName: SFSymbols.wikipedia, title: "Wikipedia")
    
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
        view.backgroundColor = .systemBackground
        configureItems()
    }
    
    @objc private func youtubeItemPressed() {
        guard
            let urlString = launch.links?.webcast,
            let url = URL(string: urlString) else {
            
            presentAlertVC(title: CustomError.title.rawValue, body: CustomError.noAvailableContent.rawValue, buttonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
    
    @objc private func pressKitPressed() {
        guard
            let urlString = launch.links?.presskit,
            let url = URL(string: urlString) else {
            
            presentAlertVC(title: CustomError.title.rawValue, body: CustomError.noAvailableContent.rawValue, buttonTitle: "Ok")
            return
            
        }
        presentSafariVC(url: url)
    }
    
    @objc private func articlePressed() {
        guard
            let urlString = launch.links?.article,
            let url = URL(string: urlString) else {
            
            presentAlertVC(title: CustomError.title.rawValue, body: CustomError.noAvailableContent.rawValue, buttonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
    
    @objc private func wikipediaPressed() {
        guard
            let urlString = launch.links?.wikipedia,
            let url = URL(string: urlString) else {
            
            presentAlertVC(title: CustomError.title.rawValue, body: CustomError.noAvailableContent.rawValue, buttonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
}

extension GFLinksVC {
    private func configureItems() {
        view.addSubviews(youtubeItemView, presskitItemView, articleItemView, wikipediaItemView)
        
        for item in [youtubeItemView, presskitItemView, articleItemView, wikipediaItemView] {
            item.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(CGFloat.itemHeight)
            }
        }
        
        youtubeItemView.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        presskitItemView.snp.makeConstraints { make in
            make.top.equalTo(youtubeItemView.snp.bottom).offset(CGFloat.margin)
        }
        
        articleItemView.snp.makeConstraints { make in
            make.top.equalTo(presskitItemView.snp.bottom).offset(CGFloat.padding)
        }
        
        wikipediaItemView.snp.makeConstraints { make in
            make.top.equalTo(articleItemView.snp.bottom).offset(CGFloat.padding)
        }
        
        youtubeItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(youtubeItemPressed)))
        
        presskitItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressKitPressed)))
        
        articleItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(articlePressed)))
        
        wikipediaItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(wikipediaPressed)))
    }
}

