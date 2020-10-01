//
//  ConditionChecker.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/04.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

class InputUserData {
    
    private let notificationCenter = NotificationCenter()
    var inputEmail: String? {
        didSet {
            if inputEmail == nil || inputEmail == "" {
                notificationCenter.sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .NoInput)
            }
            updateEmailTextFieldState()
        }
    }
    var inputPassword: String? {
        didSet {
            guard let inputPassword = inputPassword else { return }
            if inputPassword.isEmpty {
                notificationCenter.sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .NoInput)
            }
            updatePasswordTextFieldState()
        }
    }
    var inputPasswordCheck: String? {
        didSet {
            guard let inputPasswordCheck = inputPasswordCheck else { return }
            if inputPasswordCheck.isEmpty {
                
                notificationCenter.sendNotification(notificationName: NSNotification.Name.PasswordCheckTextFieldInput, textFieldState: .NoInput)
            }
            updatePasswordCheckTextFieldState()
        }
    }
    
    var inputNickname: String? {
        didSet {
            guard let nickname = inputNickname else { return }
            if nickname.isEmpty {
                notificationCenter.sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, textFieldState: .NoInput)
            }
            updateNicknameTextFieldState()
        }
    }
    var profileImage: String?
    
    private func updateEmailTextFieldState() {
        let isValid = ConditionChecker.isValidEmail(inputEmail ?? "")
        switch isValid {
        case true: notificationCenter.sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .Valid)
        case false: notificationCenter.sendNotification(notificationName: NSNotification.Name.EmailTextFieldInput, textFieldState: .WrongPattern)
        }
    }
    
    private func updatePasswordTextFieldState() {
        let isValid = ConditionChecker.isValidPassword(inputPassword ?? "")
        switch isValid {
        case true: notificationCenter.sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .Valid)
        case false: notificationCenter.sendNotification(notificationName: NSNotification.Name.PasswordTextFieldInput, textFieldState: .WrongPattern)
        }
    }
    
    private func updatePasswordCheckTextFieldState() {
        let isEqual = inputPassword == inputPasswordCheck && inputPasswordCheck != nil
        switch isEqual {
        case true: notificationCenter.sendNotification(notificationName: NSNotification.Name.PasswordCheckTextFieldInput, textFieldState: .Valid)
        case false: notificationCenter.sendNotification(notificationName: NSNotification.Name.PasswordCheckTextFieldInput, textFieldState: .NoMatched)
        }
    }
    
    private func updateNicknameTextFieldState() {
        let isValid = ConditionChecker.isValidLength(text: inputNickname ?? "" , minimum: 2, maximum: 10)
        switch isValid {
        case true: notificationCenter.sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, textFieldState: .Valid)
        case false: notificationCenter.sendNotification(notificationName: NSNotification.Name.NicknameTextFieldInput, textFieldState: .InvalidLength)
        }
    }
}

