//
//  ConditionCheck.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

struct ConditionCheck {
    
    static func isValidEmail(_ email:String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,120}"
          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailTest.evaluate(with: emailTest)
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        let passRegEx = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        return passwordTest.evaluate(with: password)
    }
}

