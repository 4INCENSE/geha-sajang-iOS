//
//  ConditionChecker.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/04.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

class InputUserData {
    
    var inputEmail: String? {
        didSet {
            if inputEmail == nil || inputEmail == "" {
                sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .NoInput)
            }
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
    var inputPasswordCheck: String? {
        didSet {
            if inputPasswordCheck == nil || inputPasswordCheck == "" {
                sendNotification(notificationName: NSNotification.Name.PasswordCheckTextFieldInput, textFieldState: .NoInput)
                updatePasswordCheckTextFieldState()
            }
        }
    }
    var nickName: String?
    {
        didSet {
            if inputPasswordCheck == nil || inputPasswordCheck == "" || inputPasswordCheck!.count < 2 {
                sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, textFieldState: .NoInput)
            }
        }
    }
    var profileImage: String?
    
    private func updateEmailTextFieldState() {
        let isValid = ConditionChecker.isValidEmail(inputEmail ?? "")
        switch isValid {
        case true: sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .Valid)
        case false: sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .WrongPattern)
        }
    }
    
    private func updatePasswordTextFieldState() {
        let isValid = ConditionChecker.isValidPassword(inputPassword ?? "")
        switch isValid {
        case true: sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .Valid)
        case false: sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .NoInput)
        }
    }
    
    private func updatePasswordCheckTextFieldState() {
        let isEqual = inputPassword == inputPassword && inputPasswordCheck != nil
        switch isEqual {
        case true: sendNotification(notificationName: NSNotification.Name.PasswordCheckTextFieldInput, textFieldState: .Valid)
        case false: sendNotification(notificationName: NSNotification.Name.PasswordCheckTextFieldInput, textFieldState: .NoMatched)
        }
    }
    
    private func sendNotification(notificationName: NSNotification.Name, textFieldState: TextFieldState){
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: [UserInfoKey.TextFieldState: textFieldState])
    }
}

