//
//  ViewUpdating.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/21.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

protocol ViewUpdating {
    var viewState: TextFieldState? { get set }
    func updateView(by state:TextFieldState)
    func setupNotification()
}
