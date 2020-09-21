//
//  EmailTextField.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

enum TextFieldPlaceholderMessage {
    static let EmailTextFieldMessage = "이메일을 입력하주세요"
    static let PasswordTextFieldMessage = "영문, 숫자 조합으로 입력해주세요(8-16자)"
    static let PasswordChekcTextFieldMessage = "비밀번호를 입력해주세요"
    static let NicknameTextFieldMessage = "2-10자로 입력해주세요"
}

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
