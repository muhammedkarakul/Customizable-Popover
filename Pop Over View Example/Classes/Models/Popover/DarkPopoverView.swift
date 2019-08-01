//
//  PopoverView.swift
//  Pop Over View Example
//
//  Created by Muhammed Karakul on 29.07.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit

protocol PopoverViewDelegate: class {
    func setLabelTitle() -> String
}

class DarkPopoverView: UIView {
    
    private lazy var popoverlabel: UILabel = {
        let label = UILabel()
        
        label.text = "Hello World! I'm a dark popover."
        label.textAlignment = .center
        label.textColor = .white
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
