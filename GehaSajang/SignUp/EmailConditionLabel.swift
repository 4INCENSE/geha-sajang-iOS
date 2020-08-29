//
//  EmailConditionLabel.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class EmailConditionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateBorderColor(_ congifure: labelConfiguration)  {
        self.text = congifure.text
        self.textColor = congifure.textColor
    }
}

struct labelConfiguration {
    let text: String
    let textColor: UIColor
}
