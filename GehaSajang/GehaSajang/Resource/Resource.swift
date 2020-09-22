//
//  Resource.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/16.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import Foundation

struct Resource {
    let name:String
    let fileType: String
}

enum ResourceName {
    static let loginBackgroundVideo = "GehaSaJangLoginBackgroundVideo"
    static let blackLogo = "gehaSaJangLogo_black"
    static let bigWhiteLogo = "gehaSaJangLogo_white_big"
    static let whiteLogo = "gehaSaJangLogo_white"
}

enum ResourceType {
    static let mp4 = ".mp4"
}

enum ColorName {
    static let mainBlue = "MainBlue"
}

enum UserType {
    case host
    case staff
}

enum Identifier {
    static let userTypeLogin = "UserTypeLogin"
}

