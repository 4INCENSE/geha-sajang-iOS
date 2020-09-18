//
//  NicknameTextFieldDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/11.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class NicknameTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var inputUserData: InputUserData?
    private var lengthCondition: TextFieldState? {
        didSet {
            sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, lengthCondition: lengthCondition!)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        inputUserData?.nickname = textField.text
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
     
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        return updatedText.count <= 10
    } 
    
    private func sendNotification(notificationName: NSNotification.Name, lengthCondition: TextFieldState) {
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: [UserInfoKey.TextFieldState: lengthCondition])
    }
}
