//
//  UIViewControllerExtension.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/10/01.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
