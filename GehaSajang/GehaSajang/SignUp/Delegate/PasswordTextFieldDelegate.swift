//
//  PasswordTextFieldDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/10.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class PasswordTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var inputUserData: InputUserData?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        inputUserData?.inputPassword = textField.text
    }
}
