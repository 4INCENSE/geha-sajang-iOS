//
//  EmailTextFieldDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/04.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class EmailTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var inputUserData: InputUserData?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        inputUserData?.inputEmail = textField.text
    }
}
