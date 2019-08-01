//
//  View.swift
//  Pop Over View Example
//
//  Created by Muhammed Karakul on 29.07.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit
import SnapKit

protocol ViewDelegate: class {
    func showDarkRightPopoverButtonAction(_ sender: UIButton)
    func showLightLeftPopoverButtonAction(_ sender: UIButton)
}

class View: UIView {
    
    weak var delegate: ViewDelegate?
    
    private(set) lazy var darkContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    private(set) lazy var lightContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    private lazy var lightLeftPopoverButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.numberOfLines = 0
        button.setTitle("Light left Pop Over", for: .normal)
        button.addTarget(self, action: #selector(showDarkRightPopoverButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var darkRightPopoverButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.numberOfLines = 0
        button.setTitle("Dark Right Pop Over", for: .normal)
        button.addTarget(self, action: #selector(showLightLeftPopoverButtonAction), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        
        backgroundColor = .white
        
        addSubview(lightContainer)
        lightContainer.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.size.equalTo(200)
        }
        
        lightContainer.addSubview(darkRightPopoverButton)
        darkRightPopoverButton.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.height.equalTo(100)
        }
        
        addSubview(darkContainer)
        darkContainer.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(lightContainer.snp.bottom).offset(16)
            maker.size.equalTo(200)
        }
        
        darkContainer.addSubview(lightLeftPopoverButton)
        lightLeftPopoverButton.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.height.equalTo(100)
        }
    }
    
    @objc
    private func showDarkRightPopoverButtonAction(_ sender: UIButton) {
        delegate?.showDarkRightPopoverButtonAction(sender)
    }
    
    @objc
    private func showLightLeftPopoverButtonAction(_ sender: UIButton) {
        delegate?.showLightLeftPopoverButtonAction(sender)
    }
    
}
