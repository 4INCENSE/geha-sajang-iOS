//
//  StringExtension.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/18.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

extension String {
  var isBlank: Bool {
    return allSatisfy({ text in text.isWhitespace })
  }
}
