//
//  ViewController.swift
//  Pop Over View Example
//
//  Created by Muhammed Karakul on 29.07.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private(set) lazy var customView: View = {
        View()
    }()

    private lazy var lightLeftPopover: Popover = {
        let popover = Popover(destinationViewController: self, popoverView: LightPopoverView())
        popover.arrowDirection = .right
        popover.backgroundColor = .white
        return popover
    }()
    
    private lazy var darkRightPopover: Popover = {
        let popover = Popover(destinationViewController: self, popoverView: DarkPopoverView())
        popover.arrowDirection = .left
        popover.backgroundColor = .black
        return popover
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
        configureAppearance()
    }
    
    private func configureAppearance() {
        
        title = "Pop Over Example"
        
        view.addSubview(customView)
        customView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

// MARK: - ViewDelegate

extension ViewController: ViewDelegate {
    func showDarkRightPopoverButtonAction(_ sender: UIButton) {
        darkRightPopover.show(withSource: customView.darkContainer, andRect: sender.frame)
    }
    
    func showLightLeftPopoverButtonAction(_ sender: UIButton) {
        lightLeftPopover.show(withSource: customView.lightContainer, andRect: sender.frame)
    }
}
