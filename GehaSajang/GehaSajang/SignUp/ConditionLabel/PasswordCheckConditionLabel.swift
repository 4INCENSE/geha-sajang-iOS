//
//  PasswordCheckConditionLabel.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/21.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class PasswordCheckConditionLabel: LabelObserver {
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.PasswordCheckTextFieldInput, object: nil)
    }
    
    override func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.PasswordCheckTextFieldInput, object: nil)
    }
}
