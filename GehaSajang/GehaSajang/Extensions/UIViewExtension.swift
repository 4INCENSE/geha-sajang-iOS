//
//  UIViewExtension.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/16.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue < 0
        }
    }
}
