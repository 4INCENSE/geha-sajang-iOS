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
            guard let inputPassword = inputPassword else { return }
            if inputPassword.isEmpty {
                sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .NoInput)
                updatePasswordTextFieldState()
            }
        }
    }
    var inputPasswordCheck: String? {
        didSet {
            guard let inputPasswordCheck = inputPasswordCheck else { return }
            if inputPasswordCheck.isEmpty {
                
                sendNotification(notificationName: NSNotification.Name.PasswordCheckTextFieldInput, textFieldState: .NoInput)
                updatePasswordCheckTextFieldState()
            }
        }
    }
    var nickname: String? {
        didSet {
            guard let nickname = nickname else { return }
            if nickname.isEmpty {
                sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, textFieldState: .NoInput)
            }
            
            let isValid = ConditionChecker.isValidLength(text: nickname, minimum: 2, maximum: 10)
            switch isValid {
            case true: sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, textFieldState: .Valid)
            case false: sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, textFieldState: .InvalidLength)
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

