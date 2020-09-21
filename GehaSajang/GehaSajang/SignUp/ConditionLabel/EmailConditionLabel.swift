//
//  EmailConditionLabel.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class EmailConditionLabel: LabelObserver {
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.EmailTextFieldInput, object: nil)
    }
    
    override func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.EmailTextFieldInput, object: nil)
    }
}
