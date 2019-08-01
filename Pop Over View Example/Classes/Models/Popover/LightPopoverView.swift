//
//  LightPopoverView.swift
//  Pop Over View Example
//
//  Created by Muhammed Karakul on 1.08.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit

class LightPopoverView: UIView {

    private lazy var popoverlabel: UILabel = {
        let label = UILabel()
        
        label.text = "Hello World! I'm a light popover."
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        
        addSubview(popoverlabel)
        popoverlabel.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
}

