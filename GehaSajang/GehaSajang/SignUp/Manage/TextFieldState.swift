//
//  TextFieldState.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/04.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

enum TextFieldState: String, CustomStringConvertible {
    
    var description: String { self.rawValue }
    case Valid = ""
    case WrongPattern = "양식에 맞게 다시 입력해주세요"
    case NoInput = "다시 입력해주세요"
    case Duplicated = "이미 가입된 이메일입니다"
    case NoMatched = "비밀번호가 일치하지 않습니다"
    case InvalidLength = "글자수 조건을 확인해주세요"
}

