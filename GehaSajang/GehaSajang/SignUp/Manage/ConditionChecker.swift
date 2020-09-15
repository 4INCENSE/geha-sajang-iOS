//
//  ConditionChecker.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

struct ConditionChecker {
    
    static let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,120}"
    static let passRegEx = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*"
    //^[A-Za-z0-9]{6,12}$
    //^(?=.*[A-Za-z])(?=.*[0-9]).{2,15}.$

    static func isValidEmail(_ email:String) -> Bool {
        evaluate(text: email, with: emailRegEx)
    }

    static func isValidPassword(_ password: String) -> Bool {
        evaluate(text: password, with: passRegEx)
    }
    
    static private func evaluate(text: String, with regex: String) -> Bool {
        NSPredicate(format: "SELF MATCHES[c] %@", regex).evaluate(with: text)
    }
    
    static func isFilled(emailTextField: String, passwordTextField: String) -> Bool {
        emailTextField.isEmpty == false && passwordTextField.isEmpty == false
    }
}
