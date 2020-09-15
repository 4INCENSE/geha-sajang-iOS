//
//  TextFieldFactoryByState.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/05.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

struct TextFieldFactoryByState {
    
    static func colorByState(state: TextFieldState) -> UIColor {
        switch state {
        case .Valid: return .blue
        case .WrongPattern: return .red
        case .NoInput: return .red
        case .Duplicated: return .orange
        case .NoMatched: return .red
        }
    }
}
