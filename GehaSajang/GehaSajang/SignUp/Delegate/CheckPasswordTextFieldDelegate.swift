//
//  CheckPasswordTextFieldDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/11.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class CheckPasswordTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var inputUserData: InputUserData?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        inputUserData?.inputPasswordCheck = textField.text
    }
}
