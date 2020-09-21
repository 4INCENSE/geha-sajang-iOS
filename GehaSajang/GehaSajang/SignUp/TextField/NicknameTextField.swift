//
//  NicknameTextField.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/11.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class NicknameTextField: TextFieldObserver {
    
    deinit {
         NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NicknameTextFieldInput, object: nil)
     }
    
    override func setupInitialView() {
        self.placeholder = TextFieldPlaceholderMessage.NicknameTextFieldMessage
    }
     
     override func setupNotification() {
         NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.NicknameTextFieldInput, object: nil)
     }
}
