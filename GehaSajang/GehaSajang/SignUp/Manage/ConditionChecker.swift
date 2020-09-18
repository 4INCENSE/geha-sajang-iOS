//
//  ConditionChecker.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

struct ConditionChecker {
    
    static private let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,120}"
    static private let passRegEx = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*"

    static func isValidEmail(_ email:String) -> Bool {
        evaluate(text: email, with: emailRegEx)
    }

    static func isValidPassword(_ password: String) -> Bool {
        evaluate(text: password, with: passRegEx)
    }
    
    static private func evaluate(text: String, with regex: String) -> Bool {
        NSPredicate(format: "SELF MATCHES[c] %@", regex).evaluate(with: text)
    }
    
    static func isValidLength(text: String, minimum: Int, maximum: Int) -> Bool {
        if text.count >= minimum && text.count <= maximum {
            return true
        }
        return false
    }
    
    static func isFilled(emailText: String?, passwordText: String?) -> Bool {
        emailText.isBlank == false && passwordText?.isBlank == false
    }
}
