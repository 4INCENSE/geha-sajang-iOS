//
//  NotificationCenterExtension.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/10/02.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

extension NotificationCenter {
    func sendNotification(notificationName: NSNotification.Name, textFieldState: TextFieldState){
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: [UserInfoKey.TextFieldState: textFieldState])
    }
    
    func sendNotification(notificationName: NSNotification.Name, viewController toPresent: UIViewController){
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: [UserInfoKey.ViewController: toPresent])
    }
}
