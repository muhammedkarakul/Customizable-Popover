//
//  Popover.swift
//  Pop Over View Example
//
//  Created by Muhammed Karakul on 1.08.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit

class Popover {
    private var sourceViewController = UIViewController()
    private var destinationViewController: UIViewController?
    private var popoverView = UIView()
    
    var arrowDirection: UIPopoverArrowDirection = .left
    var backgroundColor: UIColor = .black
    
    init(destinationViewController: UIViewController, popoverView: UIView) {
        self.destinationViewController = destinationViewController
        
        self.popoverView = popoverView
        
        sourceViewController.modalPresentationStyle = .popover
        
        configureAppearance()
    }
    
    private func configureAppearance() {
        
        sourceViewController.preferredContentSize = CGSize(width: 250, height: 100)
        sourceViewController.view.addSubview(popoverView)
        
        popoverView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    func show(withSource source: UIView, andRect rect: CGRect) {
        
        guard let destinationViewController = destinationViewController else {
            return
        }
        
        guard let popoverPresentationController = sourceViewController.popoverPresentationController else {
            return
        }
        
        popoverPresentationController.permittedArrowDirections = arrowDirection
        popoverPresentationController.backgroundColor = backgroundColor
        popoverPresentationController.sourceView = source
        popoverPresentationController.sourceRect = rect
        destinationViewController.present(sourceViewController, animated: true, completion: nil)
    }
}
