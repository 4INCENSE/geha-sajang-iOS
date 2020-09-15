//
//  SignInInputUserData.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/14.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

class SignInInputUserData {
    
    var inputEmail: String? {
        didSet {
            updateEmailTextFieldState()
        }
    }
    var inputPassword: String? {
        didSet {
            if inputPassword == nil || inputPassword == "" {
                sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .NoInput)
                updatePasswordTextFieldState()
            }
        }
    }
    
    private func updateEmailTextFieldState() {
        let isValid = inputEmail == nil || inputEmail == ""
        switch isValid {
        case true: sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .Valid)
        case false: sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .NoInput)
        }
    }
    
    private func updatePasswordTextFieldState() {
        let isValid = ConditionChecker.isValidPassword(inputPassword ?? "")
        switch isValid {
        case true: sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .Valid)
        case false: sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .NoInput)
        }
    }
    
    private func sendNotification(notificationName: NSNotification.Name, textFieldState: TextFieldState){
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: [UserInfoKey.TextFieldState: textFieldState])
    }
    
}

