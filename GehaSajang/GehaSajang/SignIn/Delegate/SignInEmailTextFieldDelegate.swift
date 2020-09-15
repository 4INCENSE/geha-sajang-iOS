//
//  SignInTextFieldDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/15.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignInEmailTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var inputUserData: SignInInputUserData?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        inputUserData?.inputEmail = textField.text
    }
}
