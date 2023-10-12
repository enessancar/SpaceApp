//
//  UIViewController+Ext.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func add(childVC: UIViewController, containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func presentAlertVC(title: String, body: String, buttonTitle: String) {
        let alertVC = presentAlertVC(title: title, body: body, buttonTitle: buttonTitle)
        
        
    }
    
    func presentSafariVC(url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
