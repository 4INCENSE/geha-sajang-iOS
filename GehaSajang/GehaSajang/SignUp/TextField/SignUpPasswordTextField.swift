//
//  SignUpPasswordTextField.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/09.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignUpPasswordTextField: TextFieldObserver {
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.PasswordTextFieldInput, object: nil)
    }
    
    override func setupInitialView() {
        self.placeholder = TextFieldPlaceholderMessage.PasswordTextFieldMessage
    }
    
    override func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.PasswordTextFieldInput, object: nil)
    }
}

