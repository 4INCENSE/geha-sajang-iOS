//
//  EmailTextField.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class EmailTextField: TextFieldObserver {
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.EmailTextFieldInput, object: nil)
    }
    
    override func setupInitialView() {
        self.placeholder = TextFieldPlaceholderMessage.EmailTextFieldMessage
    }
     
    override func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.EmailTextFieldInput, object: nil)
    }
}
