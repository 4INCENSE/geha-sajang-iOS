//
//  UIStoryboardExtension.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/15.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static let registerGuesthouseViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterGuesthouseViewController")
    static let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
    static let termsDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TermsDetailViewController")
}
