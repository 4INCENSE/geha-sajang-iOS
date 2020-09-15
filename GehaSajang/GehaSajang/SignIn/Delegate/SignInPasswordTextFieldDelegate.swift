//
//  SignInPasswordTextFieldDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/15.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignInPasswordTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var inputUserData: SignInInputUserData?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        inputUserData?.inputEmail = textField.text
    }
}
